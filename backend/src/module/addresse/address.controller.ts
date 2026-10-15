import { Request, Response, Router } from "express";
import { addressService } from "./address.service";
import { successResponce } from "../../common/responce/succ.responce";
import { validation } from "../../common/validation/validation";
import { createAddressSchema } from "./address.validation";
import { Types } from "mongoose";
import { auth, AuthRequest } from "../../common/middleware/auth";

const router = Router();
router.use(auth);
router.post(
  "/",
  validation(createAddressSchema),
  async (req: AuthRequest, res: Response) => {
    const userId = req.user!.id;

    const address = await addressService.createAddress(userId, req.body);

    successResponce({
      res,
      data: address,
      message: "Address created successfully",
      status: 201,
    });
  },
);

router.get("/", async (req: AuthRequest, res: Response) => {
  const userId = req.user!.id;

  const addresses = await addressService.getMyAddresses(userId);

  successResponce({
    res,
    data: addresses,
    message: "Addresses fetched successfully",
    status: 200,
  });
});

router.get("/:addressId", async (req: AuthRequest, res: Response) => {
  const userId = req.user!.id;
  const { addressId } = req.params;

  const address = await addressService.getAddressById(
    userId,
    addressId as string,
  );

  successResponce({
    res,
    data: address,
    message: "Address fetched successfully",
    status: 200,
  });
});

export default router;
