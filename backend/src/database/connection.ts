import mongoose from "mongoose";
import { env } from "../config/env.service.js";
export const databaseConnection = async () => {
  try {
    await mongoose.connect(env.DB_URL);
    console.log("database connection successfully");
  } catch (error) {
    console.log("❌ database failed to connect");
  }
};
