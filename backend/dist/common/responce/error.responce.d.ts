import { Errors } from "../interface/error.interface";
declare class ErrorApllication extends Error implements Errors {
    status: number;
    constructor(message: string, status: number, cause?: unknown);
}
export declare class badRequest extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export declare class unauthorized extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export declare class forbidden extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export declare class notFound extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export declare class conflict extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export declare class unprocessableEntity extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export declare class tooManyRequests extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export declare class internalServerError extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export declare class notImplemented extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export declare class badGateway extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export declare class serviceUnavailable extends ErrorApllication {
    constructor(message: string, cause?: unknown);
}
export {};
//# sourceMappingURL=error.responce.d.ts.map