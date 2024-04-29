import React from 'react';
import { Link } from 'react-router-dom';
import './orghome.css';

const Orghome = () => {
  return (
    <div className="container">
      <h1>Welcome to Disease Tracker</h1>
      <p>
        Track disease outbreaks in various cities, explore symptoms, and find
        relevant contact information.
      </p>
      <div className="options">
        <div className="option">
          <Link to='/disease'>
            <button>
              Disease
            </button>
          </Link>
          <p>Explore information about different diseases and outbreaks.</p>
        </div>
        <div className="option">
          <Link to='/disease'>
            <button>
              City
            </button>
          </Link>
          <p>View disease statistics and outbreaks in different cities.</p>
        </div>
        <div className="option">
          <Link to='/symptoms'>
            <button>
              Symptoms
            </button>
          </Link>
          <p>Learn about symptoms associated with various diseases.</p>
        </div>
        <div className="option">
          <Link to='/contact'>
            <button>
              Contact
            </button>
          </Link>
          <p>Find contact information for relevant health authorities.</p>
        </div>
      </div>

      <h2>About Us</h2>
      <p>Welcome to our website! We are a team of college students passionate about leveraging technology to make a positive impact on healthcare.</p>
      <p>Driven by our curiosity and desire to contribute to the community, we created this platform to provide valuable information about disease outbreaks and their impact on different cities.</p>
      <p>Our mission is to empower individuals with knowledge that can help them make informed decisions about their health and well-being.</p>
      <p>Thank you for visiting, and we hope you find our website helpful and informative!</p>
    </div>
  );
};

export default Orghome;
