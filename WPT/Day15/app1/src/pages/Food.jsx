import React, { useEffect } from 'react'

function Food() {
    // useEffect() // lifecyle of a component
    useEffect(() => {
        console.log('Food COmponent is loaded')
        return () => {
            console.log('Food Component is unloaded')
        }
    }, [])
    return (
        <div>
            <h1>Food Page</h1>

        </div>
    )
}

export default Food
