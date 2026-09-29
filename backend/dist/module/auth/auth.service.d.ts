import { ICreateUser, ILogin, IUser } from "../../common/interface/user.interface";
declare class AuthService {
    private userRepo;
    constructor();
    signUp(data: ICreateUser): Promise<import("mongoose").Document<unknown, {}, IUser, {}, import("mongoose").DefaultSchemaOptions> & IUser & {
        _id: import("mongoose").Types.ObjectId;
    } & {
        __v: number;
    } & {
        id: string;
    }>;
    login(data: ILogin): Promise<{
        accessToken: string;
        refreshToken: string;
    }>;
}
export declare const authService: AuthService;
export {};
//# sourceMappingURL=auth.service.d.ts.map