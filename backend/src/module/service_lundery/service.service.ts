
import { Request, Response } from "express";
import mongoose from "mongoose";
import service_model from "../../database/model/service.model.js";
import userModel from "../../database/model/user.model.js";

export const create_service = async (req: Request, res: Response) => {
    try {
        const { name, description, price, email } = req.body;

        const user = await userModel.findOne({ email });

        if (!user) {
            return res.status(404).json({
                message: "User not found"
            });
        }

        const service = await service_model.create({
            name,
            description,
            price,
            creator: user._id
        });

        return res.status(201).json({
            message: "Service created successfully",
            service
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error creating service"
        });
    }
};

export const get_all_services = async (req: Request, res: Response) => {
    try {
        const services = await service_model.find();

        return res.status(200).json({
            message: "Services fetched successfully",
            services
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error fetching services"
        });
    }
};

export const get_available_services = async (
    req: Request,
    res: Response
) => {
    try {
        const services = await service_model.find({
            isAvailable: true
        });

        return res.status(200).json({
            message: "Available services fetched successfully",
            services
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error fetching available services"
        });
    }
};

export const get_service_by_id = async (
    req: Request,
    res: Response
) => {
    try {
        const serviceId = req.params.serviceId;

        if (
            typeof serviceId !== "string" ||
            !mongoose.Types.ObjectId.isValid(serviceId)
        ) {
            return res.status(400).json({
                message: "Invalid Service ID"
            });
        }

        const service = await service_model.findById(serviceId);

        if (!service) {
            return res.status(404).json({
                message: "Service not found"
            });
        }

        return res.status(200).json({
            message: "Service fetched successfully",
            service
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error fetching service"
        });
    }
};

export const get_user_services = async (
    req: Request,
    res: Response
) => {
    try {
        const { email } = req.body;

        if (!email) {
            return res.status(400).json({
                message: "Email is required"
            });
        }

        const user = await userModel.findOne({ email });

        if (!user) {
            return res.status(404).json({
                message: "User not found"
            });
        }

        const services = await service_model.find({
            creator: user._id
        });

        return res.status(200).json({
            message: "User services fetched successfully",
            services
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error fetching user services"
        });
    }
};

export const update_service = async (
    req: Request,
    res: Response
) => {
    try {
        const serviceId = req.params.serviceId;
        const { name, description, price, isAvailable } = req.body;

        if (
            typeof serviceId !== "string" ||
            !mongoose.Types.ObjectId.isValid(serviceId)
        ) {
            return res.status(400).json({
                message: "Invalid Service ID"
            });
        }

        const updates: Record<string, unknown> = {};

        if (name !== undefined) updates.name = name;
        if (description !== undefined) updates.description = description;
        if (price !== undefined) updates.price = price;
        if (isAvailable !== undefined) updates.isAvailable = isAvailable;

        if (Object.keys(updates).length === 0) {
            return res.status(400).json({
                message: "At least one field is required"
            });
        }

        const service = await service_model.findByIdAndUpdate(
            serviceId,
            { $set: updates },
            {
                new: true,
                runValidators: true
            }
        );

        if (!service) {
            return res.status(404).json({
                message: "Service not found"
            });
        }

        return res.status(200).json({
            message: "Service updated successfully",
            service
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error updating service"
        });
    }
};

export const Delete_Service = async (
    req: Request,
    res: Response
) => {
    try {
        const serviceId = req.params.serviceId;

        if (
            typeof serviceId !== "string" ||
            !mongoose.Types.ObjectId.isValid(serviceId)
        ) {
            return res.status(400).json({
                message: "Invalid Service ID"
            });
        }

        const service = await service_model.findByIdAndDelete(serviceId);

        if (!service) {
            return res.status(404).json({
                message: "Service not found"
            });
        }

        return res.status(200).json({
            message: "Service deleted successfully",
            service
        });
    } catch (error) {
        return res.status(500).json({
            message: "Error deleting service"
        });
    }
};
