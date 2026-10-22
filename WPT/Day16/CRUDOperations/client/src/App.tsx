import React from 'react'
import { Link, Route, Routes } from 'react-router'
import AddProductPage from './pages/AddProductPage'
import AllProductsPage from './pages/AllProductsPage'

function App() {
    return (
        <div>
            <nav className='p-2 text-2xl text-blue-500'>
                <Link to='/add'>Add Product | </Link>
                <Link to='/'>All Products</Link>
            </nav>
            <Routes>
                <Route path='/' element={<AllProductsPage />} />
                <Route path='/add' element={<AddProductPage />} />
            </Routes>
        </div>
    )
}

export default App
