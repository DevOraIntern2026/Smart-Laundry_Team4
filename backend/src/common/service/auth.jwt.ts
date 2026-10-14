import jwt from "jsonwebtoken";
import { env } from "../../config/env.service";
import { unauthorized } from "../responce/error.responce";

class AuthService {
  verifyToken(token: string) {
    const decoded: any = jwt.decode(token);

    if (!decoded) {
      throw new unauthorized("Invalid token");
    }

    let signature: string = "";

    switch (decoded.aud) {
      case "admin":
        signature = env.admin_signature;
        break;

      case "user":
        signature = env.user_signature;
        break;

      default:
        throw new unauthorized("Invalid audience");
    }

    return jwt.verify(token, signature);
  }

  verifyRefreshToken(refreshToken: string) {
    const decoded: any = jwt.decode(refreshToken);

    if (!decoded) {
      throw new unauthorized("Invalid refresh token");
    }

    let signature: string = "";

    switch (decoded.aud) {
      case "admin":
        signature = env.admin_refresh_signature;
        break;

      case "user":
        signature = env.user_refresh_signature;
        break;

      default:
        throw new unauthorized("Invalid refresh token audience");
    }

    return jwt.verify(refreshToken, signature);
  }
}

export const authService = new AuthService();
