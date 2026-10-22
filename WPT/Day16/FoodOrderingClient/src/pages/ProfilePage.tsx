import React, { use, useContext, useEffect, useState } from 'react'
import NavBar from '../components/NavBar'
import { UserContext } from '../App'
import { userUpdate } from '../services/UserService'
import config from '../utils/config'
import { toast } from 'react-toastify'

function ProfilePage() {
    const context = useContext(UserContext)
    const { user } = context!

    const [name, setName] = useState('')
    const [email, setEmail] = useState('')
    const [mobile, setMobile] = useState('')

    useEffect(() => {
        setName(user!.name)
        setEmail(user!.email)
        setMobile(user!.mobile)
    }, [])

    const handleUpdateClick = async () => {
        try {
            const response = await userUpdate(mobile, sessionStorage.getItem(config.KEY_TOKEN)!)
            const result = response.data
            if (result.status == 'success') {
                toast.success('Mobile no Updated')
            }
            else
                toast.error('Profile Update Failed ')
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <div className='w-3/4 mx-auto m-2'>
            <h1 className='title'>User Profile</h1>
            <div className='flex mt-2'>
                <input type="text" value={name} readOnly className="input w-1/2 me-1" />
                <input type="text" value={email} readOnly className="input w-1/2 ms-1" />
            </div>
            <div className='mt-2'>
                <input type="text" value={mobile} className="input w-full" onChange={e => setMobile(e.target.value)} />
            </div>
            <div className='mt-2'>
                <button className='btn btn-success' onClick={handleUpdateClick} >update</button>
            </div>
        </div>
    )
}

export default ProfilePage
