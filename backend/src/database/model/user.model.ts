import { model, Schema } from "mongoose";
import { IUser } from "../../common/interface/user.interface";
import { userRole } from "../../common/enum/role.enum";

const userSchema = new Schema<IUser>(
  {
    role: {
      type: String,
      enum: Object.values(userRole),
      default: userRole.user,
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
    isVerified: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true,
  },
);
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

const userModel = model<IUser>("User", userSchema);

export default userModel;
