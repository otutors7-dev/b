import React, { useEffect, useState } from 'react'
import NavBar from '../components/NavBar'
import CartCard from '../components/CartCard'
import { useDispatch, useSelector } from 'react-redux'
import type { StoreType } from '../store'
import { toast } from 'react-toastify'
import { clearCartAction } from '../slices/CartSlice'
import { orderPlace } from '../services/OrderService'
import config from '../utils/config'

function CartPage() {
    const cartItems = useSelector((store: StoreType) => store.CartReducer.cartItems)
    const dispatch = useDispatch()
    const [totalBill, setTotalBill] = useState(0)
    const [totalQty, setTotalQty] = useState(0)

    const billSummary = () => {
        let total = 0
        let qty = 0
        cartItems.forEach(c => {
            total += (c.price * c.qty)
            qty += c.qty
        })
        setTotalBill(total)
        setTotalQty(qty)
    }

    const handlePlaceOrderClick = async () => {
        try {
            const response = await orderPlace(totalBill, cartItems, sessionStorage.getItem(config.KEY_TOKEN)!)
            const result = response.data
            if (result.status == 'success') {
                toast.success('Order Placed')
                dispatch(clearCartAction())
            }
            else
                toast.error('Failed to place the order')
        } catch (error) {
            console.log(error)
        }
    }

    useEffect(() => {
        billSummary()
    }, [cartItems])

    return (
        cartItems.length != 0 ?
            <div className='grid grid-cols-2 p-4'>
                <ul className="list bg-base-100 rounded-box shadow-md">
                    {cartItems.map(c => <CartCard cartItem={c} />)}
                </ul>
                <div className='text-center'>
                    <h1 className='text-2xl font-medium'>Bill Summary</h1>
                    <div className="stats stats-vertical lg:stats-horizontal shadow">
                        <div className="stat">
                            <div className="stat-title">Total Items</div>
                            <div className="stat-value">{cartItems.length}</div>
                        </div>

                        <div className="stat">
                            <div className="stat-title">Total Quantity</div>
                            <div className="stat-value">{totalQty}</div>
                        </div>

                        <div className="stat">
                            <div className="stat-title">Total Price</div>
                            <div className="stat-value">{totalBill}</div>
                        </div>
                    </div>
                    <div className='w-1/2 text-center mx-auto mt-2'>
                        <button className='btn btn-primary w-full' onClick={handlePlaceOrderClick}>Place Order</button>
                    </div>
                </div>
            </div>
            : <h1 className='title'>Your Cart is empty....</h1>
    )
}

export default CartPage
