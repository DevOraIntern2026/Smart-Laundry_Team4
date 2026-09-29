"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.authService = void 0;
const database_repo_1 = require("../../database/repo/database.repo");
const user_model_1 = __importDefault(require("../../database/model/user.model"));
const error_responce_1 = require("../../common/responce/error.responce");
const encryption_1 = require("../../common/utils/security/encryption");
const sendEmail_1 = require("../../common/utils/service/email/sendEmail");
const redis_service_1 = require("../../common/service/redis.service");
const token_1 = require("../../common/utils/token/token");
const role_enum_1 = require("../../common/enum/role.enum");
class AuthService {
    userRepo;
    constructor() {
        this.userRepo = new database_repo_1.DatabaseRepository(user_model_1.default);
    }
    async signUp(data) {
        const { firstName, lastName, phoneNumber, age, email, password } = data;
        const user = await this.userRepo.findOne({ email });
        if (user) {
            throw new error_responce_1.conflict("Email already exist");
        }
        const hashedPassword = await (0, encryption_1.hashing)(password);
        const addedUser = await this.userRepo.create({
            firstName,
            lastName,
            phoneNumber,
            age,
            email,
            password: hashedPassword,
            role: role_enum_1.userRole.user,
        });
        const otp = Math.floor(100000 + Math.random() * 900000);
        await redis_service_1.redisService.set({
            key: `user:${addedUser._id}`,
            value: String(otp),
            ttl: 60 * 5,
        });
        await (0, sendEmail_1.sendMail)({
            to: addedUser.email,
            subject: "welome to ou app",
            html: `<div style="font-family: Arial, sans-serif; max-width: 500px; margin: auto; padding: 30px; border: 1px solid #ddd; border-radius: 10px;"> <h2>Welcome to Smart Laundry 👋</h2> <p>Hi ${addedUser.firstName},</p> <p>Thank you for creating an account with us.</p> <p>Your verification code is:</p> <div style="font-size: 32px; font-weight: bold; letter-spacing: 8px; text-align: center; padding: 15px; margin: 20px 0; background: #f5f5f5; border-radius: 8px;"> ${otp} </div> <p>This code will expire soon. Please don't share it with anyone.</p> <p>Best regards,<br>Smart Laundry Team</p> </div> `,
        });
        return addedUser;
    }
    async login(data) {
        const { email, password } = data;
        const user = await this.userRepo.findOne({ email });
        if (!user) {
            throw new error_responce_1.notFound("email not found");
        }
        const isValid = await (0, encryption_1.compareHash)(password, user.password);
        if (!isValid) {
            throw new error_responce_1.badRequest("Incorrect password");
        }
        const { accessToken, refreshToken } = token_1.token.generateTokens(user);
        return { accessToken, refreshToken };
    }
}
exports.authService = new AuthService();
//# sourceMappingURL=auth.service.js.map