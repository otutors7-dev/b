import React, { useState } from 'react'
import { productAdd } from '../services/ProductService'

function AddProductPage() {
    const [name, setName] = useState('')
    const [price, setPrice] = useState(0)

    const handleAddProductClick = async () => {
        try {
            const response = await productAdd(name, price)
            const result = response.data
            if (result.status == 'success') {
                alert('Product Added')
                setName('')
                setPrice(0)
            }
            else
                alert(result.error)
        } catch (error) {
            console.log(error)
        }
    }
    return (
        <div>
            <div className='m-2'>
                <label className="floating-label">
                    <span>Name</span>
                    <input type="text" placeholder="product name" className="input input-md" onChange={e => setName(e.target.value)} />
                </label>
            </div>
            <div className='m-2'>
                <label className="floating-label">
                    <span>Price</span>
                    <input type="number" placeholder="price" className="input input-md" onChange={e => setPrice(parseFloat(e.target.value))} />
                </label>
            </div>
            <div className='m-2'>
                <button className="btn btn-primary" onClick={handleAddProductClick}>Add Product</button>
            </div>

        </div>
    )
}

export default AddProductPage
