import { configureStore, ReducerType } from "@reduxjs/toolkit";
import { CartReducer } from "./slices/CartSlice";

const store = configureStore({
    reducer: {
        CartReducer
    }
})

export default store
export type StoreType = ReturnType<typeof store.getState>