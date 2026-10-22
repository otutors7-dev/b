import type { AxiosResponse } from "axios";
import type { FoodMenuResponse } from "../types/Food";
import config from "../utils/config";
import axios from "axios";

export async function foodMenu(): Promise<AxiosResponse<FoodMenuResponse>> {
    const URL = config.BASE_URL + '/food/menu'
    return axios.get(URL)
}