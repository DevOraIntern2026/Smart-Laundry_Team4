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
    let signature: string = "";
    let audience: string = "";
    let refreshSignature: string = "";

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
    const decoded: any = jwt.decode(refreshToken);

    if (!decoded) {
      throw new unauthorized("Invalid refresh token");
    }

    let signature: string;

    switch (decoded.aud) {
      case "user":
        signature = env.user_refresh_signature;
        break;

      case "admin":
        signature = env.admin_refresh_signature;
        break;

      default:
        throw new unauthorized("Invalid refresh token audience");
    }

    try {
      return jwt.verify(refreshToken, signature);
    } catch (error) {
      throw new unauthorized("Invalid refresh token", error);
    }
  }
}

export const token = new Token();
