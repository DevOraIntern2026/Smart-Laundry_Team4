import { IUser } from "../../interface/user.interface";
import { Types } from "mongoose";
export type userType = IUser & {
    _id: Types.ObjectId;
};
declare class Token {
    generateTokens(user: userType): {
        accessToken: string;
        refreshToken: string;
    };
}
export declare const token: Token;
export {};
//# sourceMappingURL=token.d.ts.map