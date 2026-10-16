import { Model, PopulateOptions } from "mongoose";

export class DatabaseRepository<T> {
  private model: Model<T>;

  constructor(model: Model<T>) {
    this.model = model;
  }

  async create(data: T) {
    return await this.model.create(data);
  }

  async find(
    filter: object = {},
    select?: string,
    populate?: PopulateOptions,
    lean?: boolean,
  ) {
    const query = this.model.find(filter);

    if (select) {
      query.select(select);
    }

    if (populate) {
      query.populate(populate);
    }

    if (lean) {
      query.lean();
    }

    return await query;
  }

  async findOne(
    filter: object,
    select?: string,
    populate?: PopulateOptions,
    lean?: boolean,
  ) {
    const query = this.model.findOne(filter);

    if (select) {
      query.select(select);
    }

    if (populate) {
      query.populate(populate);
    }

    if (lean) {
      query.lean();
    }

    return await query;
  }

  async findById(
    id: string,
    select?: string,
    populate?: PopulateOptions,
    lean?: boolean,
  ) {
    const query = this.model.findById(id);

    if (select) {
      query.select(select);
    }

    if (populate) {
      query.populate(populate);
    }

    if (lean) {
      query.lean();
    }

    return await query;
  }

  async updateOne(filter: object, update: object) {
    return await this.model.updateOne(filter, update);
  }

  async findOneAndUpdate(filter: object, update: object) {
    return await this.model.findOneAndUpdate(filter, update, { new: true });
  }

  async findByIdAndUpdate(id: string, update: object) {
    return await this.model.findByIdAndUpdate(id, update, { new: true });
  }

  async deleteOne(filter: object) {
    return await this.model.deleteOne(filter);
  }

  async deleteMany(filter: object) {
    return await this.model.deleteMany(filter);
  }

  async findOneAndDelete(filter: object) {
    return await this.model.findOneAndDelete(filter);
  }

  async findByIdAndDelete(id: string) {
    return await this.model.findByIdAndDelete(id);
  }

  async countDocuments(filter: object = {}) {
    return await this.model.countDocuments(filter);
  }

  async exists(filter: object) {
    return await this.model.exists(filter);
  }
}
