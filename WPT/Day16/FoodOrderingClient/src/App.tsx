import { ToastContainer } from "react-toastify"
import SigninPage from "./pages/SigninPage"
import SignupPage from "./pages/SignupPage"
import { Navigate, Route, Routes } from "react-router"
import HomePage from "./pages/HomePage"
import FoodMenu from "./pages/FoodMenu"
import CartPage from "./pages/CartPage"
import OrdersPage from "./pages/OrdersPage"
import ProfilePage from "./pages/ProfilePage"
import { createContext, useState, type Dispatch, type SetStateAction } from "react"
import type { User } from "./types/User"

type UserContextType = { user: User | undefined, setUser: Dispatch<SetStateAction<User | undefined>> }
export const UserContext = createContext<UserContextType | undefined>(undefined)

function App() {
  const [user, setUser] = useState<User>()
  return (
    <div>
      <UserContext value={{ user, setUser }}>
        <Routes>
          <Route path="/*" element={<SigninPage />} />
          <Route path="/signup" element={<SignupPage />} />
          <Route path="/home" element={user ? <HomePage /> : <Navigate to='/' />} >
            <Route path="food" element={<FoodMenu />} />
            <Route path="cart" element={<CartPage />} />
            <Route path="orders" element={<OrdersPage />} />
            <Route path="profile" element={<ProfilePage />} />
          </Route>
        </Routes>
      </UserContext>
      <ToastContainer />
    </div >
  )
}

export default App
