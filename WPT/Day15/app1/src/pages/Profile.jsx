import React, { useEffect } from 'react'

function Profile() {
    useEffect(() => {
        console.log('Profile Component Loaded')
        return () => {
            console.log('Profile Component UnLoaded')
        }
    }, [])
    return (
        <div>
            <h1>Profile Page</h1>

        </div>
    )
}

export default Profile
