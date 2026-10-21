import React, { useContext } from 'react'
import Counter3 from './Counter3'
import { CounterContext } from '../App'

function Counter2() {
    const context = useContext(CounterContext)
    const { count, setCount } = context!
    return (
        <div>
            <h1>Counter 2 :{count} </h1>
            <button onClick={() => {
                setCount(count + 1)
            }}>increment</button>
            <button onClick={() => {
                setCount(count - 1)
            }}>decrement</button>

            <hr />
            <Counter3 />
        </div>
    )
}

export default Counter2
