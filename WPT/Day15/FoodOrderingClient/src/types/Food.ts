export interface Food {
    fid: number
    name: string
    price: number
    description: string
    image: string
}

export interface FoodMenuResponse {
    status: 'success' | 'error'
    data?: Food[]
    error?: any
}