import { NextFunction, Request, Response } from "express";

import { forbidden, unauthorized } from "../responce/error.responce";
import { authService } from "../service/auth.jwt";
import { userRole } from "../enum/role.enum";

export type AuthUser = {
  id: string;
  aud: "user" | "admin";
};

export type AuthRequest = Request & {
  user?: AuthUser;
};

export const auth = (req: AuthRequest, res: Response, next: NextFunction) => {
  try {
    const authorization = req.headers.authorization;

    if (!authorization) {
      return next(new unauthorized("Authorization header is required"));
    }

    const [flag, token, ...extra] = authorization.trim().split(/\s+/);

    if (flag !== "Bearer" || !token || extra.length > 0) {
      return next(new unauthorized("Invalid authorization format"));
    }

    const decodedUser = authService.verifyToken(token);

    if (
      typeof decodedUser !== "object" ||
      decodedUser === null ||
      !("id" in decodedUser) ||
      typeof decodedUser.id !== "string" ||
      !("aud" in decodedUser) ||
      (decodedUser.aud !== "user" && decodedUser.aud !== "admin")
    ) {
      return next(new unauthorized("Invalid token"));
    }

    req.user = {
      id: decodedUser.id,
      aud: decodedUser.aud,
    };

    return next();
  } catch (error) {
    if (error instanceof unauthorized) {
      return next(error);
    }

    return next(new unauthorized("Invalid token", error));
  }
};

export const authorize = (...roles: userRole[]) => {
  return (req: AuthRequest, res: Response, next: NextFunction) => {
    if (!req.user || !roles.includes(req.user.aud as userRole)) {
      return next(new forbidden("Insufficient permissions"));
    }

    return next();
  };
};
