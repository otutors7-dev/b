import React, { useContext } from 'react'
import { CounterContext } from '../App'

function Counter3() {
    const context = useContext(CounterContext)
    const { count, setCount } = context!
    return (
        <div>
            <h1>Counter 3 : {count} </h1>
            <button onClick={() => {
                setCount(count + 1)
            }}>increment</button>
            <button onClick={() => {
                setCount(count - 1)
            }}>decrement</button>
        </div>
    )
}

export default Counter3
