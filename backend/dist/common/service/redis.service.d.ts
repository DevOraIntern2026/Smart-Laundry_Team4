import { Types } from "mongoose";
declare class RedisService {
    private client;
    constructor();
    set: ({ key, value, ttl, }: {
        key: string;
        value: string;
        ttl: number;
    }) => Promise<string | null>;
    get: (key: string) => Promise<string | null>;
    del: (key: string) => Promise<number>;
    mget: (...keys: string[]) => Promise<(string | null)[]>;
    key: (user_id: Types.ObjectId) => string;
}
export declare const redisService: RedisService;
export {};
//# sourceMappingURL=redis.service.d.ts.map