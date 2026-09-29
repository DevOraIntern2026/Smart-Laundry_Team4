"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const role_enum_1 = require("../../common/enum/role.enum");
const userSchema = new mongoose_1.Schema({
    role: {
        type: String,
        enum: Object.values(role_enum_1.userRole),
        default: role_enum_1.userRole.user,
    },
    firstName: {
        type: String,
        required: true,
        trim: true,
    },
    lastName: {
        type: String,
        required: true,
        trim: true,
    },
    email: {
        type: String,
        required: true,
        unique: true,
        trim: true,
    },
    password: {
        type: String,
        required: true,
    },
    phoneNumber: {
        type: String,
        trim: true,
    },
    age: {
        type: Number,
        required: true,
    },
}, {
    timestamps: true,
});
userSchema
    .virtual("userName")
    .set(function (values) {
    const [firstName, lastName] = values.split(" ");
    this.firstName = firstName;
    this.lastName = lastName;
})
    .get(function () {
    return `${this.firstName} ${this.lastName}`;
});
const userModel = (0, mongoose_1.model)("User", userSchema);
exports.default = userModel;
//# sourceMappingURL=user.model.js.map