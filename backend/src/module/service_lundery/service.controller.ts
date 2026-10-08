
import { Router } from "express";
import { create_service, Delete_Service, get_all_services, get_user_services } from "./service.service.js";


const service_router = Router();


service_router.post("/create", create_service);

service_router.get("/all", get_all_services);


service_router.get("/user", get_user_services);


service_router.delete("/delete", Delete_Service);

export default service_router;
