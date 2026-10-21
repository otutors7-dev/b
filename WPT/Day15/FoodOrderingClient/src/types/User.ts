export interface User {
    name: string,
    email: string
    password?: string
    mobile: string
    token?: string
}

export interface UserSignInResponse {
    status: "success" | "error"
    data?: User
    error?: any
}

export interface UserResponse {
    status: 'success' | 'error'
    data?: any
    error?: any
}