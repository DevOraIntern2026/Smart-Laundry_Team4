import { userRole } from "../enum/role.enum";
export interface IUser {
    userName?: string;
    firstName: string;
    lastName: string;
    email: string;
    password: string;
    age: number;
    phoneNumber?: string;
    role: userRole;
}
export interface ICreateUser {
    firstName: string;
    lastName: string;
    email: string;
    password: string;
    age: number;
    phoneNumber?: string;
}
export interface ILogin {
    email: string;
    password: string;
}
//# sourceMappingURL=user.interface.d.ts.map