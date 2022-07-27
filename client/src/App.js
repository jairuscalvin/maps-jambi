import './App.css';
import Navbar from './components/Navbar'
import Home from './components/Home'
import Survey from './components/Survey';
// import Login from './Components/Login'
// import Register from './Components/Register'

import {
    BrowserRouter,
    Route,
    Routes
} from "react-router-dom"


function App() {

  return (
    <BrowserRouter> 
      <Navbar/>
          <Routes>
            <Route index path='/' element={<Home/>} />
            <Route index path='/home' element={<Home/>} />
            <Route index path='/survey' element={<Survey/>} />
          </Routes>
    </BrowserRouter>
  );
}

export default App;
