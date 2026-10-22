import axios, { type AxiosResponse } from 'axios';
import type { APIResponse, Product } from '../types/Product';


export function productAdd(name: string, price: number): Promise<AxiosResponse<APIResponse<any>>> {
    const URL = 'http://localhost:4000/product'
    const body = { name, price }
    return axios.post(URL, body)
}

export function productUpdate(pid: number, price: number): Promise<AxiosResponse<APIResponse<any>>> {
    const URL = 'http://localhost:4000/product'
    const body = { pid, price }
    return axios.put(URL, body)
}

export function productDelete(pid: number): Promise<AxiosResponse<APIResponse<any>>> {
    const URL = 'http://localhost:4000/product/' + pid
    return axios.delete(URL)
}

export function productsAll(): Promise<AxiosResponse<APIResponse<Product[]>>> {
    const URL = 'http://localhost:4000/product'
    return axios.get(URL)
}