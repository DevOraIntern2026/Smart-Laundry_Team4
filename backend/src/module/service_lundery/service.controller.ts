import { Router } from "express";

import {
    create_service,
    Delete_Service,
    get_all_services,
    get_user_services
} from "./service.service.js";



import {
    create_service_schema,
    get_user_services_schema,
    delete_service_schema
} from "./service.validation.js";
import { validation } from "../../common/middleware/service.middleware.js";

const service_router = Router();

service_router.post(
    "/create",
    validation(create_service_schema),
    create_service
);

service_router.get(
    "/all",
    get_all_services
);

service_router.get(
    "/user",
    validation(get_user_services_schema),
    get_user_services
);

service_router.delete(
    "/delete",
    validation(delete_service_schema),
    Delete_Service
);

export default service_router;