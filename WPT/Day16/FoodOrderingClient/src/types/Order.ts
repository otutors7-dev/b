export interface OrderResponse {
    status: 'success' | 'error'
    data?: any
    error?: any
}

export interface Order {
    oid: number
    odate: string
    deldate: string | null
    total_amount: number
    status: 'PENDING' | 'PROCESSING' | 'CANCELLED' | 'DELIVERED'
}

export interface OrderHistoryResponse {
    status: 'success' | 'error'
    data?: Order[]
    error?: any
}