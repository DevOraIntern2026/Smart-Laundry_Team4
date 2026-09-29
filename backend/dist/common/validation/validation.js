"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.validation = void 0;
const error_responce_1 = require("../responce/error.responce");
const validation = (schema) => {
    return (req, res, next) => {
        let validationErros = [];
        for (const key of Object.keys(schema)) {
            if (!schema[key]) {
                throw new error_responce_1.badRequest("Validation error");
            }
            const value = schema[key].safeParse(req[key]);
            if (!value.success) {
                validationErros.push({
                    key,
                    issue: value.error.issues,
                });
            }
            if (validationErros.length > 0) {
                throw new error_responce_1.badRequest("validatioin error", validationErros);
            }
            next();
        }
    };
};
exports.validation = validation;
//# sourceMappingURL=validation.js.map