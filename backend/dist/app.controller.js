"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.boostrap = void 0;
const express_1 = __importDefault(require("express"));
const env_service_1 = require("./config/env.service");
const connection_1 = require("./database/connection");
const catcher_1 = require("./common/middleware/catcher");
const redis_connection_1 = __importDefault(require("./database/redis/redis.connection"));
const auth_controller_1 = __importDefault(require("./module/auth/auth.controller"));
const boostrap = async () => {
    const app = (0, express_1.default)();
    await (0, connection_1.databaseConnection)();
    await redis_connection_1.default.connection();
    app.use(express_1.default.json());
    app.use("/auth", auth_controller_1.default);
    app.use(catcher_1.catchErrors);
    app.listen(env_service_1.env.port, () => console.log(`server is runing on port ${env_service_1.env.port}`));
};
exports.boostrap = boostrap;
//# sourceMappingURL=app.controller.js.map