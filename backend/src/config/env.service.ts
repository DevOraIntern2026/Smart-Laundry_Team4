import dotenv from "dotenv";
import path from "node:path";
import { Env } from "../common/interface/env.interface";

const envPath = path.resolve(process.cwd(), "backend", "src", "config", "dev.env");

dotenv.config({ path: envPath });

export const env: Env = {
  DB_URL:process.env.DB_URL as string,
  port: process.env.PORT as string,
  mood: process.env.MOOD as string,
  salt_rounds: process.env.SALT_ROUNDS as string,
  user_email: process.env.EMAIL_USER as string,
  user_password: process.env.EMAIL_PASSWORD as string,
  redis_url: process.env.REDIS_URL as string,
  user_signature: process.env.USER_SIGNATURE as string,
  admin_signature: process.env.ADMIN_SIGNATURE as string,
  user_refresh_signature: process.env.USER_REFRESH_SIGNATURE as string,
  admin_refresh_signature: process.env.ADMIN_REFRESH_SIGNATURE as string,
  client_id: process.env.CLIENT_ID as string,
  client_secret: process.env.CLIENT_SECRET as string,
};