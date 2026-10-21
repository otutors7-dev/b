import React, { useEffect, useState } from 'react'

function Counter() {
    const [count1, setCount1] = useState(0)
    const [count2, setCount2] = useState(0)

    useEffect(() => {
        console.log('Counter loaded')
    }, [count1])
    return (
        <div>
            <h1>Count1 : {count1} </h1>
            <h1>Count2 : {count2}</h1>
            <button onClick={() => setCount1(count1 + 1)}>increment1</button>
            <button onClick={() => setCount1(count1 - 1)}>decrement1</button>
            <button onClick={() => setCount2(count2 + 2)}>increment2</button>
            <button onClick={() => setCount2(count2 - 2)}>decrement2</button>
        </div>
    )
}

export default Counter
