import jwt from "jsonwebtoken";
import { env } from "../../../config/env.service";
import { IUser } from "../../interface/user.interface";
import { Types } from "mongoose";
import { badRequest, unauthorized } from "../../responce/error.responce";
import { userRole } from "../../enum/role.enum";

export type userType = IUser & {
  _id: Types.ObjectId;
};

class Token {
  generateTokens(user: userType) {
    let signature: string;
    let audience: "user" | "admin";
    let refreshSignature: string;

    switch (user.role) {
      case userRole.user:
        signature = env.user_signature;
        audience = "user";
        refreshSignature = env.user_refresh_signature;
        break;

      case userRole.admin:
        signature = env.admin_signature;
        audience = "admin";
        refreshSignature = env.admin_refresh_signature;
        break;

      default:
        throw new badRequest("Error happened in token");
    }

    const accessToken = jwt.sign({ id: user._id }, signature, {
      audience,
      expiresIn: "30m",
    });

    const refreshToken = jwt.sign({ id: user._id }, refreshSignature, {
      audience,
      expiresIn: "1y",
    });

    return { accessToken, refreshToken };
  }

  verifyRefreshToken(refreshToken: string) {
    try {
      const decoded = jwt.decode(refreshToken);

      if (
        !decoded ||
        typeof decoded === "string" ||
        typeof decoded.aud !== "string"
      ) {
        throw new unauthorized("Invalid refresh token");
      }

      let signature: string;
      let audience: "user" | "admin";

      switch (decoded.aud) {
        case "user":
          signature = env.user_refresh_signature;
          audience = "user";
          break;

        case "admin":
          signature = env.admin_refresh_signature;
          audience = "admin";
          break;

        default:
          throw new unauthorized("Invalid refresh token audience");
      }

      return jwt.verify(refreshToken, signature, {
        audience,
      });
    } catch (error) {
      if (error instanceof unauthorized) {
        throw error;
      }

      throw new unauthorized("Invalid refresh token", error);
    }
  }
}

export const token = new Token();
