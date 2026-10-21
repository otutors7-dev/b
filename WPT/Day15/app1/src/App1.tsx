import React from 'react'
import Home from './pages/Home';
import { Link, Route, Routes } from 'react-router';
import Cart from './pages/Cart';
import Profile from './pages/Profile';
import Orders from './pages/Orders';
import Food from './pages/Food';
import Counter from './pages/Counter';

function App1() {
    return (
        <div>
            <nav>
                <Link to='/counter'>Counter | </Link>
                <Link to='/home'>Home | </Link>
                <Link to='/home/food'>Food | </Link>
                <Link to='/home/cart'>Cart | </Link>
                <Link to='/home/orders'>Orders | </Link>
                <Link to='/home/profile'>Profile | </Link>
            </nav>
            <Routes>
                <Route path='/counter' element={<Counter />} />
                <Route path='/home' element={<Home />} >
                    <Route path='cart' element={<Cart />} />
                    <Route path='profile' element={<Profile />} />
                    <Route path='orders' element={<Orders />} />
                    <Route path='food' element={<Food />} />
                </Route>x
            </Routes>
        </div>
    )
}

export default App1
