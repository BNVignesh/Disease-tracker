import React, { useState } from 'react'
import  './contact.css'
import axios from 'axios'
const Contact = () => {
  const [values,setvalues]=useState({
    email:'',
    message:''
  });
  const [status,setstat]=useState('')
  async function sendquery(){
    await axios.post('http://localhost:8088/contact',values).then((res)=>{if(res.data.status==='success'){setstat('Query sent')}}).then((err)=>{console.log(err)})
  }
  return (
    <div>
      <h2>You can Contact us </h2>
      <form action="">
        <div className="mail"><div>Email :</div><input type="email" onChange={(e)=>{setvalues({...values,email:e.target.value})}}/></div>
        <div className="query"><div>Message:</div><textarea name="" id="" cols="30" rows="10" onChange={(e)=>{setvalues({...values,message:e.target.value})}}></textarea></div>
        <button onClick={()=>{sendquery()}}>send</button>
        <div>{status}</div>
      </form>
    </div>
  )
}

export default Contact
