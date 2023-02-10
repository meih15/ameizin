import './HomeBackgroundCarousel.css';
import React from 'react';
import { Carousel } from 'react-responsive-carousel';
import kindleBackground from '../../image/background1.jpg';
import electronicsBackground from '../../image/background2.jpg';
import { Link } from 'react-router-dom';


const NextArrow = (props) => {
  const { onClick } = props;
  return (
    <button
      onClick={onClick}
      style={{
        backgroundColor: "red",
        border: "none",
        color: "white",
        padding: "10px 20px",
        fontSize: "20px",
        borderRadius: "50%",
        cursor: "pointer"
      }}
    >
      &gt;
    </button>
  );
};

const PrevArrow = (props) => {
  const { onClick } = props;
  return (
    <button
      onClick={onClick}
      style={{
        backgroundColor: "blue",
        border: "none",
        color: "white",
        padding: "10px 20px",
        fontSize: "20px",
        borderRadius: "50%",
        cursor: "pointer"
      }}
    >
      &lt;
    </button>
  );
};


const BackgroundCarousel = () => {
    return(
    <Carousel showArrows={true} 
                showStatus={false} 
                showIndicators={false} 
                width='100%'
                // infiniteLoop={true}
                nextArrow={<NextArrow />}
            prevArrow={<PrevArrow />}
        >
        <div className='home-image'>
            <Link to={'/products/3'}>
                <img id='bckgd-image'src={kindleBackground} alt='kindle' />
            </Link>
        </div>
        <div className='home-image'>
            <Link to={'/products/4'}>
                <img id='bckgd-image' src={electronicsBackground} alt='electronic' />
            </Link>
        </div>
    </Carousel>
    )
}

export default BackgroundCarousel;
