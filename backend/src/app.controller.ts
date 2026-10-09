
import express from "express";
import type { Express } from "express";
import { env } from "./config/env.service";
import { databaseConnection } from "./database/connection";
import { catchErrors } from "./common/middleware/catcher";
import redisConnection from "./database/redis/redis.connection";
import authController from "./module/auth/auth.controller";
import service_router from "./module/service_lundery/service.controller.js";
import order_router from "./module/oreder_service/order.controller.js";


export const boostrap = async () => {
    const app: Express = express();

    await databaseConnection();
    await redisConnection.connection();

    app.use(express.json());

    app.use("/service", service_router);
    app.use("/auth", authController);
    app.use("/orders", order_router);

    app.use(catchErrors);

    app.listen(env.port, () =>
        console.log(`server is running on port ${env.port}`)
    );
};
