import { createSlice, type PayloadAction } from "@reduxjs/toolkit";
import type { CartItem } from "../types/Food";

type InitialStateType = { cartItems: CartItem[] }
const initialState: InitialStateType = { cartItems: [] }

const CartSlice = createSlice({
    name: 'cart',
    initialState,
    reducers: {
        addToCartAction: (state, action: PayloadAction<CartItem>) => {
            const index = state.cartItems.findIndex(c => c.fid == action.payload.fid)
            if (index == -1)
                state.cartItems.push(action.payload)
            else
                state.cartItems.at(index)!.qty += 1
        },
        incrementQtyAction: (state, action: PayloadAction<number>) => {
            const index = state.cartItems.findIndex(c => c.fid == action.payload)
            state.cartItems.at(index)!.qty += 1
        },
        decrementQtyAction: (state, action) => {
            const index = state.cartItems.findIndex(c => c.fid == action.payload)
            if (state.cartItems.at(index)!.qty == 1)
                state.cartItems.splice(index, 1)
            else
                state.cartItems.at(index)!.qty -= 1
        },
        clearCartAction: (state) => {
            state.cartItems.length = 0
        }
    }
})

export const CartReducer = CartSlice.reducer
export const { addToCartAction, incrementQtyAction, decrementQtyAction, clearCartAction } = CartSlice.actions 