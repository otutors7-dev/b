import React, { createContext, useState, type SetStateAction } from 'react'
import Counter1 from './components/Counter1'
import Counter2 from './components/Counter2'

// create a type for the Context (only specific to TS)
// interface CounterContextType { count: number, setCount: React.Dispatch<SetStateAction<number>> }
type CounterContextType = { count: number, setCount: React.Dispatch<SetStateAction<number>> }
// Context
export const CounterContext = createContext<CounterContextType | undefined>(undefined)

function App() {
  const [count, setCount] = useState(0)
  return (
    <div>
      {/* <Counter1 count={count} setCount={setCount} />
      <hr />
      <Counter2 count={count} setCount={setCount} /> */}

      {/* Before React 19 the child components must be kept inside context provider */}
      {/* <CounterContext.Provider></CounterContext.Provider> */}

      {/* From React 19 the child components must be kept inside context directly */}

      <CounterContext value={{ count, setCount }}>
        <Counter1 />
        <hr />
        <Counter2 />
      </CounterContext>
    </div>
  )
}

export default App
