import React, { useContext } from 'react'
import { Link, useNavigate } from 'react-router'
import config from '../utils/config'
import { UserContext } from '../App'
import { useSelector } from 'react-redux'
import type { StoreType } from '../store'

function NavBar() {
    const cartItems = useSelector((store: StoreType) => store.CartReducer.cartItems)
    const context = useContext(UserContext)
    const { setUser } = context!
    const navigate = useNavigate()

    const handleLogoutClick = () => {
        sessionStorage.removeItem(config.KEY_TOKEN)
        setUser(undefined)
        navigate('/')
    }

    return (
        <nav>
            <div className="navbar bg-base-100 shadow-sm">
                <div className="navbar-start">
                    <div className="dropdown">
                        <div tabIndex={0} role="button" className="btn btn-ghost lg:hidden">
                            <svg aria-label="Menu" xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"> <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M4 6h16M4 12h8m-8 6h16" /> </svg>
                        </div>
                        <ul
                            tabIndex={-1}
                            className="menu menu-sm dropdown-content bg-base-100 rounded-box z-1 mt-3 w-52 p-2 shadow">
                            <li><Link to='/home/cart'>cart({cartItems.length})</Link></li>
                            <li><Link to='/home/orders'>orders</Link></li>
                            <li><Link to='/home/profile'>profile</Link></li>
                        </ul>
                    </div>
                    <Link to='/home/food' className="btn btn-ghost text-xl">Food</Link>
                </div>
                <div className="navbar-center hidden lg:flex">
                    <ul className="menu menu-horizontal px-1">
                        <li><Link to='/home/cart'>cart({cartItems.length})</Link></li>
                        <li><Link to='/home/orders'>orders</Link></li>
                        <li><Link to='/home/profile'>profile</Link></li>

                    </ul>
                </div>
                <div className="navbar-end">
                    <button className="btn btn-error" onClick={handleLogoutClick}>Logout</button>
                </div>
            </div>
        </nav>
    )
}

export default NavBar
