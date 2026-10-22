import type { AxiosResponse } from "axios";
import type { CartItem } from "../types/Food";
import { type OrderHistoryResponse, type OrderResponse } from './../types/Order';
import config from "../utils/config";
import axios from "axios";

export function orderPlace(total_amount: number, cartItems: CartItem[], token: string): Promise<AxiosResponse<OrderResponse>> {
    const URL = config.BASE_URL + '/orders'
    const body = {
        total_amount,
        cartItems
    }
    const headers = { authorization: 'Bearer ' + token }
    return axios.post(URL, body, { headers })
}

export function orderHistory(token: string): Promise<AxiosResponse<OrderHistoryResponse>> {
    const URL = config.BASE_URL + '/orders'
    const headers = { authorization: 'Bearer ' + token }
    return axios.get(URL, { headers })
}