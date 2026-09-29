"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const auth_service_1 = require("./auth.service");
const succ_responce_1 = require("../../common/responce/succ.responce");
const router = (0, express_1.Router)();
router.post("/signup", async (req, res) => {
    const user = await auth_service_1.authService.signUp(req.body);
    (0, succ_responce_1.successResponce)({
        res,
        data: user,
        message: "Account created successfully",
        status: 201,
    });
});
router.post("/login", async (req, res) => {
    const user = await auth_service_1.authService.login(req.body);
    (0, succ_responce_1.successResponce)({
        res,
        data: user,
        message: "logined successfully",
        status: 200,
    });
});
exports.default = router;
//# sourceMappingURL=auth.controller.js.map