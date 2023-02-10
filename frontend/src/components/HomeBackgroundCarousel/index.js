import './HomeBackgroundCarousel.css';
import React from 'react';
import { Carousel } from 'react-responsive-carousel';
import kindleBackground from '../../image/background1.png';
import electronicsBackground from '../../image/background2.png';
import { Link } from 'react-router-dom';


const BackgroundCarousel = () => {
    <Carousel>
        <div>
            <Link to='/products/3'>
                <img src={kindleBackground} alt='kindle' />
            </Link>
        </div>
        <div>
            <Link to='/products/4'>
                <img src={electronicsBackground} alt='electronic' />
            </Link>
        </div>
    </Carousel>
}

export default BackgroundCarousel;
