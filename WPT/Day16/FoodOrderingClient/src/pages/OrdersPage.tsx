import React, { useEffect, useState } from 'react'
import { orderHistory } from '../services/OrderService'
import config from '../utils/config'
import { toast } from 'react-toastify'
import type { Order } from '../types/Order'

function OrdersPage() {
    const [orders, setOrders] = useState<Order[]>([])

    const getAllOrders = async () => {
        try {
            const response = await orderHistory(sessionStorage.getItem(config.KEY_TOKEN)!)
            const result = response.data
            if (result.status == 'success') {
                setOrders(result.data!)
            }
            else
                toast.error(result.error)
        } catch (error) {
            console.log(error)
        }
    }

    useEffect(() => {
        getAllOrders()
    }, [])

    return (
        <div>
            <table className='table table-zebra'>
                <thead>
                    <tr>
                        <th>oid</th>
                        <th>Order Date</th>
                        <th>Delivery Date</th>
                        <th>Order Status</th>
                        <th>Total Bill</th>
                    </tr>
                </thead>
                <tbody>
                    {orders.map(o => {
                        return <tr>
                            <td>{o.oid}</td>
                            <td>{o.odate}</td>
                            <td>{o.deldate}</td>
                            <td>{o.status}</td>
                            <td>{o.total_amount}</td>
                        </tr>
                    })}
                </tbody>

            </table>

        </div>
    )
}

export default OrdersPage
