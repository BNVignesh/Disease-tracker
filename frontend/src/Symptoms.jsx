import React, { useState } from 'react'
import axios from 'axios';
import './symptoms.css'
const Symptoms = () => {
    const [data,setdata]=useState([]);
    const [dname,setdie]=useState('');
    async function getsymp(dname){
        await axios.get('http://localhost:8088/symptom/'+dname).then(resdata=>{setdata(resdata.data); console.log(data)}).then((err)=>{console.log(err)});
        console.log(data);
      }
  return (
    <div>
      <h2>Symptoms</h2>
      <div className="input">
        <span>Enter disease name :</span><input type="text" name="" id="" onChange={(e)=>{setdie(e.target.value)}}/><button onClick={()=>{getsymp(dname)}}>Search</button>
        {<div className="souput">
              {/* <div>
                <p>Disease name : {data[0].name}</p>
                <p>Symptoms : {data[0].symptom}, {data[0].symptom1} ,{data[0].symptom2}</p>
              </div> */}
           {data.map((item)=>(
            <div key={item.symptome_id}>
                <p>Disease name : {item.name}</p>
                <p>Symptoms : {item.symptom}, {item.symptom1} ,{item.symptom2}</p>
                <p>Outbreak id:{item.outbreak_id}</p>
                <p>-------------</p>
            </div>
           ))}
        </div> }
      </div>
    </div>
  )
}

export default Symptoms
