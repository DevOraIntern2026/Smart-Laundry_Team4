import dotenv from "dotenv";
import path from "node:path";
import { Env } from "../common/interface/env.interface";

const envPath = path.resolve(
  process.cwd(),
  "src",
  "config",
  "dev.env",
);

const result = dotenv.config({ path: envPath });

if (result.error) {
  throw new Error(
    `Failed to load environment file at ${envPath}: ${result.error.message}`,
  );
}

function getEnv(key: string): string {
  const value = process.env[key];

  if (!value || !value.trim()) {
    throw new Error(`Missing environment variable: ${key}`);
  }

  return value;
}

export const env: Env = {
  DB_URL: getEnv("DB_URL"),
  port: getEnv("PORT"),
  // mood: getEnv("MOOD"),
  salt_rounds: getEnv("SALT_ROUNDS"),
  user_email: getEnv("EMAIL_USER"),
  user_password: getEnv("EMAIL_PASSWORD"),
  redis_url: getEnv("REDIS_URL"),
  user_signature: getEnv("USER_SIGNATURE"),
  admin_signature: getEnv("ADMIN_SIGNATURE"),
  user_refresh_signature: getEnv("USER_REFRESH_SIGNATURE"),
  admin_refresh_signature: getEnv("ADMIN_REFRESH_SIGNATURE"),
  client_id: getEnv("CLIENT_ID"),
  client_secret: getEnv("CLIENT_SECRET"),
};