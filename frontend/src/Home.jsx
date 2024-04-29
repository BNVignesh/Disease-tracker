import React, { useState } from 'react';
import './home.css';
import axios from 'axios';

const Home = () => {
  const [data, setData] = useState([]);
  const [name, setName] = useState('');
  const [cname, setCname] = useState('');
  const [city, setCity] = useState([]);
  const [diseaseError, setDiseaseError] = useState('');
  const [cityError, setCityError] = useState('');

  const getdata = async (name) => {
    try {
      const res = await axios.get(`http://localhost:8088/${name}`);
      setData(res.data);
      setDiseaseError('');
    } catch (error) {
      setDiseaseError('Error fetching data. Please try again.');
    }
  };

  const getcity = async (name) => {
    try {
      const res = await axios.get(`http://localhost:8088/city/${name}`);
      setCity(res.data);
      setCityError('');
    } catch (error) {
      setCityError('Error fetching data. Please try again.');
    }
  };

  return (
    <div>
      <h2>Diseases & Cities</h2>
      <div className='main'>
        <div className="disease">
          <p>Enter the disease name to get details:</p>
          <div className="dinput">
            <span>Select your disease:</span>
            <input type="text" onChange={(e) => setName(e.target.value)} />
            <button onClick={() => { getdata(name) }}>Search</button>
          </div>
          <div className="output">
            {diseaseError && <p className="error">{diseaseError}</p>}
            {data.map((item) => (
              <div key={item.disease_id}>
                <p>Disease ID: {item.disease_id}</p>
                <p>Incubation Period: {item.incubation_period}</p>
                <p>Death Rate: {item.death_rate}</p>
                <p>Outbreak ID: {item.outbreak_id}</p>
                <p>------------------</p>
              </div>
            ))}
          </div>
        </div>
        <div className="city">
          <p>Enter the city name to get information:</p>
          <div className="cinput">
            <span>Select city:</span>
            <input type="text" onChange={(e) => setCname(e.target.value)} />
            <button onClick={() => { getcity(cname) }}>Search</button>
          </div>
          <div className="coutput">
            {cityError && <p className="error">{cityError}</p>}
            {city.map((city) => (
              <div key={city.city_id}>
                <p>Name: {city.name}</p>
                <p>State: {city.state}</p>
                <p>Outbreak: {city.outbreak_id}</p>
                <p>Start: {city.date}</p>
                <p>End: {city.end_date}</p>
                <p>Duration: {city.duration}</p>
                <p>------------------</p>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Home;
