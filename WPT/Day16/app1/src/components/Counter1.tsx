import React from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { decrementAction, incrementAction } from '../slices/CounterSlice'

function Counter1() {
    const count = useSelector(store => store.CounterReducer.count)
    const dispatch = useDispatch()
    return (
        <div>
            <h1>Counter1 : {count}</h1>
            <button onClick={() => dispatch(incrementAction(2))}>increment</button>
            <button onClick={() => dispatch(decrementAction(1))}>decrement</button>
        </div>
    )
}

export default Counter1
