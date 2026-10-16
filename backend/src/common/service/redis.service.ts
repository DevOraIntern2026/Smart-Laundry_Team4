import { createClient, RedisClientType } from "redis";

import { Types } from "mongoose";
import redisConnection from "../../database/redis/redis.connection";

class RedisService {
  private client: RedisClientType;
  constructor() {
    this.client = redisConnection.getClient();
  }
  set = async ({
    key,
    value,
    ttl,
  }: {
    key: string;
    value: string;
    ttl: number;
  }) => {
    return this.client.set(key, value, { EX: ttl });
  };
  get = async (key: string) => {
    return this.client.get(key);
  };
  del = async (key: string) => {
    return this.client.del(key);
  };
  mget = async (...keys: string[]) => {
    return this.client.MGET(keys);
  };

  key = (user_id: Types.ObjectId) => {
    return `user:${user_id}`;
  };
}

export const redisService = new RedisService();
