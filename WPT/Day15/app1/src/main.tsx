import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'
import App1 from './App1.tsx'
import { BrowserRouter } from 'react-router'

createRoot(document.getElementById('root')!).render(
  // <App />
  <BrowserRouter>
    <App1 />
  </BrowserRouter>
)
