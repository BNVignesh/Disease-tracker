import { BrowserRouter,Route,Routes } from "react-router-dom";
import React from 'react';
import ReactDOM from 'react-dom/client';
import reportWebVitals from './reportWebVitals';
import Home from './Home';
import Orghome from './Orghome';
import Symptoms from './Symptoms';
import Contact from "./Contact";
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
 <>
 <BrowserRouter>

    <Routes>
        <Route path='/' element ={<Orghome/>} />
        <Route path="/disease" element={<Home/>}/>
        <Route path="/symptoms" element={<Symptoms/>}/>
        <Route path='/contact' element={<Contact/>}/>
    </Routes>
 </BrowserRouter>
 </>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
