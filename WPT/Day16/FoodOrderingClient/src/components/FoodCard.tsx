import React from 'react'
import type { Food } from '../types/Food'
import config from '../utils/config'
import { useDispatch } from 'react-redux'
import { addToCartAction } from '../slices/CartSlice'

function FoodCard(food: Food) {
    const dispatch = useDispatch()
    return (
        <div className="card bg-base-100 w-80 shadow-sm m-2">
            <figure>
                <img
                    src={config.BASE_URL + '/foodimage/' + food.image}
                    alt="Shoes" />
            </figure>
            <div className="card-body">
                <h2 className="card-title">{food.name}</h2>
                <h2 className='font-medium'>Price : {food.price}</h2>
                <p className='h-18'>{food.description}</p>
                <div className="card-actions justify-end">
                    <button className="btn btn-primary" onClick={() => dispatch(addToCartAction({ ...food, qty: 1 }))}>Add To Cart</button>
                </div>
            </div>
        </div>
    )
}

export default FoodCard
