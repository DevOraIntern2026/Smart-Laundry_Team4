import { userRole } from "../enum/role.enum";

declare global {
  namespace Express {
    interface User {
      id: string;
      aud: "user" | "admin";
    }

    interface Request {
      user?: User;
    }
  }
}

export {};
