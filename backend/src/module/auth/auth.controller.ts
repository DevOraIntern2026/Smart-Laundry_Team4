import { Request, Response, Router } from "express";
import { authService } from "./auth.service";
import { successResponce } from "../../common/responce/succ.responce";
import { validation } from "../../common/validation/validation";
import {
  loginSchema,
  logoutSchema,
  refreshTokenSchema,
  signUpSchema,
  verifyOTPSchema,
} from "./auth.validation";
const router = Router();
router.post(
  "/signup",
  validation(signUpSchema),
  async (req: Request, res: Response) => {
    const user = await authService.signUp(req.body);
    successResponce({
      res,
      data: user,
      message: "Account created successfully",
      status: 201,
    });
  },
);

router.post(
  "/login",
  validation(loginSchema),
  async (req: Request, res: Response) => {
    const user = await authService.login(req.body);
    successResponce({
      res,
      data: user,
      message: "Logged in successfully",
      status: 200,
    });
  },
);

router.post(
  "/verify-otp",
  validation(verifyOTPSchema),
  async (req: Request, res: Response) => {
    const { userId, otp } = req.body;

    const user = await authService.verifyOTP(userId, otp);

    successResponce({
      res,
      data: user,
      message: "Account verified successfully",
      status: 200,
    });
  },
);

router.post(
  "/refresh-token",
  validation(refreshTokenSchema),
  async (req: Request, res: Response) => {
    const { refreshToken } = req.body;
    const data = await authService.refreshToken(refreshToken);
    successResponce({
      res,
      data,
      message: "Access token refreshed successfully",
      status: 200,
    });
  },
);

router.post(
  "/logout",
  validation(logoutSchema),
  async (req: Request, res: Response) => {
    const { refreshToken } = req.body;

    await authService.logout(refreshToken);

    successResponce({
      res,
      data: "success",
      message: "Logged out successfully",
      status: 200,
    });
  },
);
export default router;
