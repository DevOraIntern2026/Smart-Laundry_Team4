import jwt from "jsonwebtoken";
import { env } from "../../config/env.service";
import { unauthorized } from "../responce/error.responce";

class AuthService {
  verifyToken(token: string) {
    try {
      const decoded = jwt.decode(token);

      if (
        !decoded ||
        typeof decoded === "string" ||
        typeof decoded.aud !== "string"
      ) {
        throw new unauthorized("Invalid token");
      }

      let signature: string;
      let audience: "user" | "admin";

      switch (decoded.aud) {
        case "admin":
          signature = env.admin_signature;
          audience = "admin";
          break;

        case "user":
          signature = env.user_signature;
          audience = "user";
          break;

        default:
          throw new unauthorized("Invalid audience");
      }

      return jwt.verify(token, signature, {
        audience,
      });
    } catch (error) {
      if (error instanceof unauthorized) {
        throw error;
      }

      throw new unauthorized("Invalid token", error);
    }
  }
}

export const authService = new AuthService();
