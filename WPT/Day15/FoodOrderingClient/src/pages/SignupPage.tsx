import { useState } from 'react'
import { userSignUp } from '../services/UserService'
import { Link, useNavigate } from 'react-router'
import { toast } from 'react-toastify'
function SignupPage() {
    const navigate = useNavigate()
    const [name, setName] = useState('')
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [mobile, setMobile] = useState('')

    const handleSignupClick = async () => {
        try {
            const response = await userSignUp({ name, email, password, mobile })
            const result = response.data
            if (result.status == 'success') {
                toast.success("signup successful")
                navigate('/')
            }
            else
                toast.error('Signup Failed...')
        } catch (error) {
            console.log(error)
        }

    }

    return (
        <div>
            <h1 className="title text-center">Create your Account ...</h1>
            <div className="bg-amber-100 w-2/5 mx-auto p-4 rounded-2xl">
                <div className="m-2">
                    <label className="floating-label">
                        <span>Your Name</span>
                        <input type="text" placeholder="name" className="input input-md" onChange={e => setName(e.target.value)} />
                    </label>
                </div>
                <div className="m-2">
                    <label className="floating-label">
                        <span>Your Email</span>
                        <input type="email" placeholder="mail@site.com" className="input input-md" onChange={e => setEmail(e.target.value)} />
                    </label>
                </div>
                <div className="m-2">
                    <label className="floating-label">
                        <span>Password</span>
                        <input type="password" placeholder="*******" className="input input-md" onChange={e => setPassword(e.target.value)} />
                    </label>
                </div>
                <div className="m-2">
                    <label className="floating-label">
                        <span>Mobile No</span>
                        <input type="tel" placeholder="+91" className="input input-md" onChange={e => setMobile(e.target.value)} />
                    </label>
                </div>
                <div className="m-2">
                    <label>Already have an account ? To Signin <Link to='/' className="text-blue-600">Click Here</Link></label>
                </div>
                <div className="m-2">
                    <button className="btn btn-success" onClick={handleSignupClick}>Signup</button>
                </div>
            </div>
        </div >
    )
}

export default SignupPage
