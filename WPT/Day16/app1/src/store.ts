import { configureStore } from "@reduxjs/toolkit";
import { CounterReducer } from "./slices/CounterSlice";

const store = configureStore({
    reducer: {
        CounterReducer
    }
})

export default store