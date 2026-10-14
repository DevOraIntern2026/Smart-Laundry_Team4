import { DatabaseRepository } from "../../database/repo/database.repo";
import { I_laundry_item } from "../../common/interface/laundry-item.interface";
import { badRequest } from "../../common/responce/error.responce";
import { laundry_item_model } from "../../database/model/laundry-item.model";

class LaundryItemService {
  private laundryItemRepo: DatabaseRepository<I_laundry_item>;

  constructor() {
    this.laundryItemRepo = new DatabaseRepository<I_laundry_item>(
      laundry_item_model,
    );
  }

  async createLaundryItem(data: I_laundry_item) {
    const { name, description, category, isAvailable } = data;

    const existingItem = await this.laundryItemRepo.findOne({
      name,
    });

    if (existingItem) {
      throw new badRequest("Laundry item already exists");
    }

    const item = await this.laundryItemRepo.create({
      name,
      description,
      category,
      isAvailable: isAvailable ?? true,
    });

    return item;
  }

  async getLaundryItems() {
    const items = await this.laundryItemRepo.find({});
    return items;
  }
}

export const laundryItemService = new LaundryItemService();
