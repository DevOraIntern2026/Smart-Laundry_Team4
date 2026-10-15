import { Provider } from "../enum/provider.enum";
import { userRole } from "../enum/role.enum";

export interface IUser {
  firstName: string;
  lastName: string;
  email: string;
  password?: string;
  age?: number;
  phoneNumber?: string;
  role: userRole;
  provider: Provider;
  isVerified: boolean;
}

export interface ICreateUser {
  firstName: string;
  lastName: string;
  email: string;
  password: string;
  age: number;
  phoneNumber?: string;
}
export interface ICreateGoogleUser {
  firstName: string;
  lastName: string;
  email: string;
  provider: Provider.GOOGLE;
  isVerified: boolean;
}

export interface ILogin {
  email: string;
  password: string;
}
