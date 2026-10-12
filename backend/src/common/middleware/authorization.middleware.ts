
import {
  type Request,
  type Response,
  type NextFunction,
} from "express";

import { userRole } from "../enum/role.enum";

export const authorization = (...allowedRoles: userRole[]) => {
  return (
    req: Request,
    res: Response,
    next: NextFunction
  ) => {
    if (!req.user) {
      return res.status(401).json({
        success: false,
        message: "Unauthorized: Please login first",
      });
    }

    if (!allowedRoles.includes(req.user.role as userRole)) {
      return res.status(403).json({
        success: false,
        message: "Forbidden: Insufficient permissions",
      });
    }

    next();
  };
};
