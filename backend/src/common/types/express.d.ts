
import { userRole } from "../enum/role.enum";

declare global {
    namespace Express {
    interface User {
        id: string;
        role: userRole;
    }

    interface Request {
        user?: User;
    }
  }
}

export {};