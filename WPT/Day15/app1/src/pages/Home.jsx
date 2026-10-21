import React from 'react'
import { Outlet } from 'react-router'

function Home() {
    return (
        <div>
            <h1>Home Page</h1>
            <Outlet />
        </div>
    )
}

export default Home
