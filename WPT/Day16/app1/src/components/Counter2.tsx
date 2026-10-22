import React from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { decrementAction, incrementAction } from '../slices/CounterSlice'

function Counter2() {
    const count = useSelector(store => store.CounterReducer.count)
    const dispatch = useDispatch()
    return (
        <div>
            <h1>Counter2 : {count}</h1>
            <button onClick={() => dispatch(incrementAction(1))}>increment</button>
            <button onClick={() => dispatch(decrementAction(2))}>decrement</button>
        </div>
    )
}

export default Counter2
