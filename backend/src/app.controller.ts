import express from "express";
import type { Express } from "express";
import { env } from "./config/env.service";
import { databaseConnection } from "./database/connection";
import { catchErrors } from "./common/middleware/catcher";
import redisConnection from "./database/redis/redis.connection";
import authController from "./module/auth/auth.controller";
export const boostrap = async () => {
  const app: Express = express();
  await databaseConnection();
  await redisConnection.connection();
  app.use(express.json());
  app.use("/auth", authController);
  app.use(catchErrors);
  app.listen(env.port, () =>
    console.log(`server is runing on port ${env.port}`),
  );
};
