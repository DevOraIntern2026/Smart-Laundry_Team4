export interface Env {
  DB_URL:string,
  port: string;
  mood: string;
  salt_rounds: string;
  user_email: string;
  user_password: string;
  redis_url: string;
  user_signature: string;
  admin_signature: string;
  user_refresh_signature: string;
  admin_refresh_signature: string;
  client_id: string;
  client_secret: string;
}
