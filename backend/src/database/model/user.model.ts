import { model, Schema } from "mongoose";
import { IUser } from "../../common/interface/user.interface";
import { userRole } from "../../common/enum/role.enum";
import { Provider } from "../../common/enum/provider.enum";

const userSchema = new Schema<IUser>(
  {
    role: {
      type: String,
      enum: Object.values(userRole),
      default: userRole.user,
    },
    provider: {
      type: String,
      enum: Object.values(Provider),
      default: Provider.SYSTEM,
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
      required: function (): boolean {
        return this.provider === Provider.SYSTEM;
      },
    },
    phoneNumber: {
      type: String,
      trim: true,
    },
    age: {
      type: Number,
      min: 0,
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
