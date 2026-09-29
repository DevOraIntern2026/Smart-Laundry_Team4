"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.redisService = void 0;
const redis_connection_1 = __importDefault(require("../../database/redis/redis.connection"));
class RedisService {
    client;
    constructor() {
        this.client = redis_connection_1.default.getClient();
    }
    set = async ({ key, value, ttl, }) => {
        return this.client.set(key, value, { EX: ttl });
    };
    get = async (key) => {
        return this.client.get(key);
    };
    del = async (key) => {
        return this.client.del(key);
    };
    mget = async (...keys) => {
        return this.client.MGET(keys);
    };
    key = (user_id) => {
        return `user:${user_id}`;
    };
}
exports.redisService = new RedisService();
//# sourceMappingURL=redis.service.js.map