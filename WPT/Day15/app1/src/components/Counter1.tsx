import { useContext } from "react"
import { CounterContext } from "../App"

function Counter1() {
    const context = useContext(CounterContext)
    const { count, setCount } = context!
    return (
        <div>
            <h1>Counter 1 : {count}</h1>
            <button onClick={() => {
                setCount(count + 1)
            }}>increment</button>
            <button onClick={() => {
                setCount(count - 1)
            }}>decrement</button>
        </div>
    )
}

export default Counter1
