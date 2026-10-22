import React from 'react'
import type { CartItem } from '../types/Food'
import config from '../utils/config'
import { useDispatch } from 'react-redux'
import { decrementQtyAction, incrementQtyAction } from '../slices/CartSlice'

function CartCard({ cartItem }: { cartItem: CartItem }) {
    const dispatch = useDispatch()
    return (
        <li className="list-row">
            <div><img className="size-10 rounded-box" alt="Tailwind CSS list item" src={`${config.BASE_URL}/foodimage/${cartItem.image}`} /></div>
            <div>
                <div>{cartItem.name}</div>
                <div className="text-xs uppercase font-semibold opacity-60">{cartItem.price}</div>
            </div>
            <button className="btn btn-square" onClick={() => dispatch(incrementQtyAction(cartItem.fid))}>+</button>
            <p className='my-auto'>{cartItem.qty}</p>
            <button className="btn btn-square" onClick={() => dispatch(decrementQtyAction(cartItem.fid))}>-</button>
        </li>
    )
}

export default CartCard
