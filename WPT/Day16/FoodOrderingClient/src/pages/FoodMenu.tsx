import React, { useEffect, useState } from 'react'
import { foodMenu } from '../services/FoodService'
import FoodCard from '../components/FoodCard'
import type { Food } from '../types/Food'

function FoodMenu() {
    const [foodItems, setFoodItems] = useState<Food[]>()
    const getFoodMenu = async () => {
        try {
            const response = await foodMenu()
            const result = response.data
            if (result.status == 'success') {
                setFoodItems(result.data!)
            }
        } catch (error) {
            console.log(error)
        }
    }

    useEffect(() => { getFoodMenu() }, [])

    return (
        <div className='grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3'>
            {foodItems?.map(f => <FoodCard fid={f.fid} name={f.name} price={f.price} description={f.description} image={f.image} />)}
        </div>
    )
}

export default FoodMenu
