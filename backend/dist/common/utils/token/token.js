"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.token = void 0;
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const env_service_1 = require("../../../config/env.service");
const error_responce_1 = require("../../responce/error.responce");
const role_enum_1 = require("../../enum/role.enum");
class Token {
    generateTokens(user) {
        let signature = "";
        let audience = "";
        let refreshSignature = "";
        switch (user.role) {
            case role_enum_1.userRole.user:
                signature = env_service_1.env.user_signature;
                audience = "user";
                refreshSignature = env_service_1.env.user_refresh_signature;
                break;
            case role_enum_1.userRole.admin:
                signature = env_service_1.env.admin_signature;
                audience = "admin";
                refreshSignature = env_service_1.env.admin_refresh_signature;
                break;
            default:
                throw new error_responce_1.badRequest("error happened in token");
        }
        const accessToken = jsonwebtoken_1.default.sign({ id: user._id }, signature, {
            audience: audience,
            expiresIn: "30m",
        });
        const refreshToken = jsonwebtoken_1.default.sign({ id: user._id }, refreshSignature, {
            audience: audience,
            expiresIn: "1y",
        });
        return { accessToken, refreshToken };
    }
}
exports.token = new Token();
//# sourceMappingURL=token.js.map