import { createSlice } from "@reduxjs/toolkit";

const CounterSlice = createSlice({
    name: 'counter',
    initialState: {
        count: 0
    },
    reducers: {
        incrementAction: (state, action) => {
            state.count += action.payload
        },
        decrementAction: (state, action) => {
            state.count -= action.payload
        }
    }
})

export const CounterReducer = CounterSlice.reducer
export const { incrementAction, decrementAction } = CounterSlice.actions