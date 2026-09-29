import { RedisClientType } from "redis";
declare class RedisConnection {
    private client;
    constructor();
    handleConnection(): void;
    connection(): Promise<import("@redis/client").RedisClientType<import("redis").RedisDefaultModules, {}, {}, 3, {}>>;
    getClient(): RedisClientType;
}
declare const _default: RedisConnection;
export default _default;
//# sourceMappingURL=redis.connection.d.ts.map