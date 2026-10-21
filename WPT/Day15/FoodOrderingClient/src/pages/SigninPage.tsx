import { useContext, useState } from "react"
import { userSignIn } from "../services/UserService"
import type { AxiosResponse } from "axios"
import { type UserSignInResponse } from './../types/User';
import { toast } from "react-toastify";
import { Link, useNavigate } from "react-router";
import { UserContext } from "../App";
import config from "../utils/config";

function SigninPage() {
    const navigate = useNavigate() // used to perform dynamic navigation
    const context = useContext(UserContext)
    const { setUser } = context!
    const [email, setEmail] = useState<string>('')
    const [password, setPassword] = useState<string>('')

    const handleSigninClick = async () => {
        try {
            const response: AxiosResponse<UserSignInResponse> = await userSignIn(email, password)
            console.log(response)
            const result: UserSignInResponse = response.data
            console.log(result)
            if (result.status == 'success') {
                toast.success("signin successful")
                sessionStorage.setItem(config.KEY_TOKEN, result.data!.token!)
                setUser(result.data)
                navigate('/home/food')
            } else
                toast.error(result.error)
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <div>
            <h1 className="title text-center">Signin to your Account ...</h1>
            <div className="bg-amber-100 w-2/5 mx-auto p-4 rounded-2xl">
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
                    <label>Don't have an account ? To Register <Link to='/signup' className="text-blue-600">Click Here</Link></label>
                </div>
                <div className="m-2">
                    <button className="btn btn-success" onClick={handleSigninClick}>Signin</button>
                </div>
            </div>
        </div >
    )
}

export default SigninPage
