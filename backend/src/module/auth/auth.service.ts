import {
  ICreateUser,
  ILogin,
  IUser,
} from "../../common/interface/user.interface";
import { DatabaseRepository } from "../../database/repo/database.repo";
import userModel from "../../database/model/user.model";
import {
  badRequest,
  conflict,
  notFound,
  unauthorized,
} from "../../common/responce/error.responce";
import { compareHash, hashing } from "../../common/utils/security/encryption";
import { sendMail } from "../../common/utils/service/email/sendEmail";
import { redisService } from "../../common/service/redis.service";
import { token, userType } from "../../common/utils/token/token";
import { userRole } from "../../common/enum/role.enum";
import { OAuth2Client } from "google-auth-library";
import { env } from "../../config/env.service";
import { Provider } from "../../common/enum/provider.enum";
class AuthService {
  private userRepo: DatabaseRepository<IUser>;
  constructor() {
    this.userRepo = new DatabaseRepository<IUser>(userModel);
  }

  async signUp(data: ICreateUser) {
    const { firstName, lastName, phoneNumber, age, email, password } = data;
    const user = await this.userRepo.findOne({ email });
    if (user) {
      throw new conflict("Email already exist");
    }
    const hashedPassword = await hashing(password);
    const addedUser = await this.userRepo.create({
      firstName,
      lastName,
      phoneNumber,
      age,
      email,
      provider: Provider.SYSTEM,
      password: hashedPassword,
      role: userRole.user,
      isVerified: false,
    });
    const otp = Math.floor(100000 + Math.random() * 900000);
    await redisService.set({
      key: `user:${addedUser._id}`,
      value: String(otp),
      ttl: 60 * 5,
    });
    await sendMail({
      to: addedUser.email,
      subject: "Welcome to Smart Laundry",
      html: `<div style="font-family: Arial, sans-serif; max-width: 500px; margin: auto; padding: 30px; border: 1px solid #ddd; border-radius: 10px;"> <h2>Welcome to Smart Laundry 👋</h2> <p>Hi ${addedUser.firstName},</p> <p>Thank you for creating an account with us.</p> <p>Your verification code is:</p> <div style="font-size: 32px; font-weight: bold; letter-spacing: 8px; text-align: center; padding: 15px; margin: 20px 0; background: #f5f5f5; border-radius: 8px;"> ${otp} </div> <p>This code will expire soon. Please don't share it with anyone.</p> <p>Best regards,<br>Smart Laundry Team</p> </div> `,
    });
    return addedUser;
  }

  async login(data: ILogin) {
    const { email, password } = data;
    const user: userType | null = await this.userRepo.findOne({ email });
    if (!user) {
      throw new notFound("email not found");
    }
    if (!user.password) {
      throw new badRequest("Please login with Google");
    }
    const isValid = await compareHash(password, user.password);
    if (!isValid) {
      throw new badRequest("Incorrect password");
    }
    if (!user.isVerified) {
      throw new badRequest("Please verify your account first");
    }

    const { accessToken, refreshToken } = token.generateTokens(user);
    await redisService.set({
      key: `refresh:${user._id}`,
      value: refreshToken,
      ttl: 60 * 60 * 24 * 365,
    });
    return { accessToken, refreshToken };
  }

  async verifyOTP(userId: string, otp: string) {
    const savedOTP = await redisService.get(`user:${userId}`);

    if (!savedOTP) {
      throw new badRequest("OTP expired or not found");
    }

    if (savedOTP !== otp) {
      throw new badRequest("Invalid OTP");
    }

    const user = await this.userRepo.updateOne(
      { _id: userId },
      { isVerified: true },
    );
    await redisService.del(`user:${userId}`);
    return user;
  }

  async refreshToken(refreshToken: string) {
    const decoded: any = token.verifyRefreshToken(refreshToken);
    const userId = decoded.id;
    const savedToken = await redisService.get(`refresh:${userId}`);
    if (!savedToken) {
      throw new unauthorized("Refresh token expired or logged out");
    }
    if (savedToken !== refreshToken) {
      throw new unauthorized("Invalid refresh token");
    }
    const user = await this.userRepo.findOne({
      _id: userId,
    });
    if (!user) {
      throw new notFound("User not found");
    }
    const { accessToken } = token.generateTokens(user);
    return {
      accessToken,
    };
  }

  async logout(refreshToken: string) {
    const decoded: any = token.verifyRefreshToken(refreshToken);
    const userId = decoded.id;
    await redisService.del(`refresh:${userId}`);
    return true;
  }

  signInWithGoogle = async (idToken: string) => {
    const client = new OAuth2Client({
      clientId: env.client_id,
    });
    const ticket = await client.verifyIdToken({
      idToken,
      audience: env.client_id,
    });
    const payload = ticket.getPayload();
    if (!payload) {
      throw new Error("Invalid Google token");
    }
    if (!payload.email || !payload.name || payload.email_verified !== true) {
      throw new badRequest("Invalid Google account data");
    }
    const user = await this.userRepo.findOne({
      email: payload.email,
    });
    if (user) {
      const { accessToken, refreshToken } = token.generateTokens(user);
      return {
        accessToken,
        refreshToken,
      };
    }
    let [firstName, ...lastNameParts] = payload.name.split(" ");
    if (!firstName) {
      firstName = "User";
    }
    const lastName = lastNameParts.join(" ") || "User";
    const newUser = await this.userRepo.create({
      firstName,
      lastName,
      email: payload.email,
      role: userRole.user,
      provider: Provider.GOOGLE,
      isVerified: payload.email_verified,
    });
    if (!newUser) {
      throw new badRequest("can't add user");
    }
    const { accessToken, refreshToken } = token.generateTokens(newUser);
    return {
      accessToken,
      refreshToken,
    };
  };
}

export const authService = new AuthService();
