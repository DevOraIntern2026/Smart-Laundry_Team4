import mongoose from "mongoose";
export const databaseConnection = async () => {
  try {
    await mongoose.connect("mongodb://localhost:27017/smart_laundry");
    console.log("database connection successfully");
  } catch (error) {
    console.log("❌ database failed to connect");
  }
};
