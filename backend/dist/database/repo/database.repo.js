"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.DatabaseRepository = void 0;
class DatabaseRepository {
    model;
    constructor(model) {
        this.model = model;
    }
    async create(data) {
        return await this.model.create(data);
    }
    async find(filter = {}, select, populate, lean) {
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
    async findOne(filter, select, populate, lean) {
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
    async findById(id, select, populate, lean) {
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
    async updateOne(filter, update) {
        return await this.model.updateOne(filter, update);
    }
    async findOneAndUpdate(filter, update) {
        return await this.model.findOneAndUpdate(filter, update, { new: true });
    }
    async findByIdAndUpdate(id, update) {
        return await this.model.findByIdAndUpdate(id, update, { new: true });
    }
    async deleteOne(filter) {
        return await this.model.deleteOne(filter);
    }
    async deleteMany(filter) {
        return await this.model.deleteMany(filter);
    }
    async findOneAndDelete(filter) {
        return await this.model.findOneAndDelete(filter);
    }
    async findByIdAndDelete(id) {
        return await this.model.findByIdAndDelete(id);
    }
    async countDocuments(filter = {}) {
        return await this.model.countDocuments(filter);
    }
    async exists(filter) {
        return await this.model.exists(filter);
    }
}
exports.DatabaseRepository = DatabaseRepository;
//# sourceMappingURL=database.repo.js.map