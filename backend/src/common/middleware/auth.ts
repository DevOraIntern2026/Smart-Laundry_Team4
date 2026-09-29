import { NextFunction, Request, Response } from "express";

import { unauthorized } from "../responce/error.responce";
import { authService } from "../service/auth.jwt";

export type AuthRequest = Request & {
  user?: any;
};

export const auth = async (
  req: AuthRequest,
  res: Response,
  next: NextFunction,
) => {
  const { authorization } = req.headers;

  if (!authorization) {
    throw new unauthorized("Authorization header is required");
  }

  const [flag, token] = authorization.split(" ");

  if (!flag || !token) {
    throw new unauthorized("Invalid authorization format");
  }

  try {
    switch (flag) {
      case "Bearer":
        const decodedUser = authService.verifyToken(token);
        req.user = decodedUser;
        next();
        break;

      default:
        throw new unauthorized("Invalid authorization type");
    }
  } catch (error) {
    throw new unauthorized("Invalid token");
  }
};
