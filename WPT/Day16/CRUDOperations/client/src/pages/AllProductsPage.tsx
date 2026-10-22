import React, { useEffect, useState } from 'react'
import type { Product } from '../types/Product'
import { productDelete, productsAll, productUpdate } from '../services/ProductService'

function AllProductsPage() {
    const [products, setProducts] = useState<Product[]>([])
    const [updatePrice, setUpdatePrice] = useState<number>(0)

    const handleUpdateClick = async (p: Product) => {
        console.log('INside update')
        try {
            const input = document.getElementById(`${p.pid}`) as HTMLElement
            const response = await productUpdate(p.pid, parseFloat(input.value))
            const result = response.data
            if (result.status == 'success') {
                alert('price updated')
                getAllProducts()
            }
        } catch (error) {
            console.log(error)
        }
    }
    const handleDeleteClick = async (p: Product) => {
        try {
            const response = await productDelete(p.pid)
            const result = response.data
            if (result.status == 'success') {
                alert('product delete')
                getAllProducts()
            }
        } catch (error) {
            console.log(error)
        }

    }

    const getAllProducts = async () => {
        try {
            const response = await productsAll()
            const result = response.data
            if (result.status == 'success')
                setProducts(result.data!)
        } catch (error) {
            console.log(error)
        }
    }

    useEffect(() => {
        getAllProducts()
    }, [])
    return (
        <div>
            <table className='table'>
                <thead>
                    <tr>
                        <th>#pid</th>
                        <th>name</th>
                        <th>price</th>
                        <th>new Price</th>
                        <th>edit</th>
                        <th>delete</th>
                    </tr>
                </thead>

                <tbody>
                    {products.map(p => {
                        return <tr>
                            <td>{p.pid}</td>
                            <td>{p.name}</td>
                            <td>{p.price}</td>
                            <td>
                                <input id={`${p.pid}`} type="number" placeholder='updated Price' onChange={e => setUpdatePrice(parseFloat(e.target.value))} />
                            </td>
                            <td><button className='btn btn-warning' onClick={() => {
                                handleUpdateClick(p)
                            }}>update</button></td>
                            <td><button className='btn btn-error' onClick={() => {
                                handleDeleteClick(p)
                            }}>delete</button></td>
                        </tr>
                    })}
                </tbody>
            </table>
        </div>
    )
}

export default AllProductsPage
