import { DatabaseRepository } from "../../database/repo/database.repo";
import addressModel from "../../database/model/address.model";
import { IAddress } from "../../common/interface/address.interface";
import { badRequest, notFound } from "../../common/responce/error.responce";
import { Types } from "mongoose";

class AddressService {
  private addressRepo: DatabaseRepository<IAddress>;
  constructor() {
    this.addressRepo = new DatabaseRepository<IAddress>(addressModel);
  }

  async createAddress(userId: string, data: Omit<IAddress, "user">) {
    if (!Types.ObjectId.isValid(userId)) {
      throw new badRequest("Invalid user ID");
    }

    const { street, city, building, apartment, isDefault } = data;

    const address = await this.addressRepo.create({
      user: new Types.ObjectId(userId),
      street,
      city,
      building,
      apartment,
      isDefault: isDefault ?? false,
    });

    return address;
  }

  async getMyAddresses(userId: string) {
    if (!Types.ObjectId.isValid(userId)) {
      throw new badRequest("Invalid user ID");
    }

    const addresses = await this.addressRepo.find({
      user: new Types.ObjectId(userId),
    });

    return addresses;
  }

  async getAddressById(userId: string, addressId: string) {
    if (!Types.ObjectId.isValid(userId) || !Types.ObjectId.isValid(addressId)) {
      throw new badRequest("Invalid user ID or address ID");
    }

    const address = await this.addressRepo.findOne({
      _id: new Types.ObjectId(addressId),
      user: new Types.ObjectId(userId),
    });

    if (!address) {
      throw new notFound("Address not found");
    }

    return address;
  }
}

export const addressService = new AddressService();
