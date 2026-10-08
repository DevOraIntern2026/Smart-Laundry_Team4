
import { Request, Response } from "express";
import mongoose from "mongoose";
import service_model from "../../database/model/service.model.js";
import userModel from "../../database/model/user.model.js";

// Create Service
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
        return res.status(400).json({
            message: "Error creating service",
            error
        });
    }
};


// Get All Services
export const get_all_services = async (
    req: Request,
    res: Response
) => {
    try {
        const services = await service_model.find();

        return res.status(200).json({
            message: "Services fetched successfully",
            services
        });

    } catch (error) {
        return res.status(400).json({
            message: "Error fetching services",
            error
        });
    }
};


// Get User Services
export const get_user_services = async (
    req: Request,
    res: Response
) => {
    try {
        const { email } = req.body;

        const user = await userModel.findOne({ email });

        if (!user) {
            return res.status(404).json({
                message: "User not found"
            });
        }

        const services = await service_model.find({
            Creator: user._id
        });

        return res.status(200).json({
            message: "User services fetched successfully",
            services
        });

    } catch (error) {
        return res.status(400).json({
            message: "Error fetching user services",
            error
        });
    }
};


// Delete Service
export const Delete_Service = async (
    req: Request,
    res: Response
) => {
    try {
        const { serviceId } = req.body;

        // Check if ID is valid
        if (!mongoose.Types.ObjectId.isValid(serviceId)) {
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
        return res.status(400).json({
            message: "Error deleting service",
            error
        });
    }
};
