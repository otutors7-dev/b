export interface Product {
    pid: number
    name: string
    price: number
}

export interface APIResponse<T> {
    status: 'success' | 'error'
    data?: T
    error?: any
}
