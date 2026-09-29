import { NextFunction, Request, Response } from "express";
import { ZodType } from "zod";
type validationKey = keyof Request;
type validationSchema = Partial<Record<validationKey, ZodType>>;
export declare const validation: (schema: validationSchema) => (req: Request, res: Response, next: NextFunction) => void;
export {};
//# sourceMappingURL=validation.d.ts.map