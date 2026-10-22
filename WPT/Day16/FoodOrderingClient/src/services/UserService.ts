import axios, { type AxiosResponse } from "axios";
import config from "../utils/config";
import type { User, UserSignInResponse, UserResponse } from "../types/User";

export function userSignIn(email: string, password: string): Promise<AxiosResponse<UserSignInResponse>> {
    const URL = config.BASE_URL + '/user/signin'
    const body = { email, password }
    return axios.post(URL, body)
}

export function userSignUp(user: User): Promise<AxiosResponse<UserResponse>> {
    const URL = config.BASE_URL + '/user/signup'
    return axios.post(URL, user)
}

export function userUpdate(mobile: string, token: string): Promise<AxiosResponse<UserResponse>> {
    const URL = config.BASE_URL + '/user'
    const body = { mobile }
    const headers = { authorization: 'Bearer ' + token }
    return axios.put(URL, body, { headers })
}