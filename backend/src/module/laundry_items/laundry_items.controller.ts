import { Request, Response, Router } from "express";
import { successResponce } from "../../common/responce/succ.responce";
import { validation } from "../../common/validation/validation";
import { createLaundryItemSchema } from "./laundry_items.validation";
import { laundryItemService } from "./laundry_items.service";

const router = Router();

router.post(
  "/",
  validation(createLaundryItemSchema),
  async (req: Request, res: Response) => {
    const item = await laundryItemService.createLaundryItem(req.body);

    successResponce({
      res,
      data: item,
      message: "Laundry item created successfully",
      status: 201,
    });
  },
);

router.get("/", async (req: Request, res: Response) => {
  const items = await laundryItemService.getLaundryItems();

  successResponce({
    res,
    data: items,
    message: "Laundry items fetched successfully",
    status: 200,
  });
});

export default router;
