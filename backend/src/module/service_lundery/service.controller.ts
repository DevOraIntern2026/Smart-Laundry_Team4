
import { Router } from "express";

import {
    create_service,
    Delete_Service,
    get_all_services,
    get_user_services,
    get_service_by_id,
    update_service,
    get_available_services
} from "./service.service.js";

import {
    create_service_schema,
    get_user_services_schema,
    delete_service_schema,
    get_service_by_id_schema,
    update_service_schema
} from "./service.validation.js";

import { validation } from "../../common/middleware/service.middleware.js";

import { auth } from "../../common/middleware/auth.js";
import { authorization } from "../../common/middleware/authorization.middleware.js";
import { userRole } from "../../common/enum/role.enum.js";

const service_router = Router();

// Create service: ADMIN only
service_router.post(
    "/create",
    auth,
    authorization(userRole.admin),
    validation(create_service_schema),
    create_service
);

// Get all services: USER or ADMIN
service_router.get(
    "/all",
    auth,
    authorization(userRole.user, userRole.admin),
    get_all_services
);

// Get available services: USER or ADMIN
service_router.get(
    "/available",
    auth,
    authorization(userRole.user, userRole.admin),
    get_available_services
);

// Get services created by a user: ADMIN only
service_router.get(
    "/user",
    auth,
    authorization(userRole.admin),
    validation(get_user_services_schema),
    get_user_services
);

// Get service by ID: USER or ADMIN
service_router.get(
    "/:serviceId",
    auth,
    authorization(userRole.user, userRole.admin),
    validation(get_service_by_id_schema),
    get_service_by_id
);

// Update service: ADMIN only
service_router.patch(
    "/:serviceId",
    auth,
    authorization(userRole.admin),
    validation(update_service_schema),
    update_service
);

// Delete service: ADMIN only
service_router.delete(
    "/delete/:serviceId",
    auth,
    authorization(userRole.admin),
    validation(delete_service_schema),
    Delete_Service
);

export default service_router;
