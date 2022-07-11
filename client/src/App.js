import './App.css';
import { Container } from '@mui/material'
import Home from './components/Home'
// import Login from './Components/Login'
// import Register from './Components/Register'
import Navbar from './components/Navbar'

import {
    BrowserRouter,
    Route,
    Routes
} from "react-router-dom"

function App() {

  return (
    <BrowserRouter> 
      <Navbar/>
        <Container>
          <Routes>
            <Route index path='/' element={<Home/>} />

          </Routes>
        </Container>
     
    </BrowserRouter>
  );
}

export default App;
