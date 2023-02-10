import './ImageSlider.css';
import React, { useState } from "react";
import { Link } from 'react-router-dom';

const ImageSlider = ({images, imageLinks}) => {
    const [currentImage, setCurrentImage] = useState(0);

    const handlePrevClick = () => {
        setCurrentImage(currentImage === 0 ? 1 : 0);
    };

    const handleNextClick = () => {
        setCurrentImage(currentImage === 0 ? 1 : 0);
    };

     return (
        <div className="image-slider">
            <div id='left-button'>
            <button className="prev-button" onClick={handlePrevClick}>
                {"<"}
            </button>
            </div>
                <Link to={imageLinks[currentImage]}>
                    <img src={images[currentImage]} alt="slider" />
                </Link>
            <div id='left-button'>
            <button className="next-button" onClick={handleNextClick}>
                {">"}
            </button>
            </div>
        </div>
  );
};

export default ImageSlider;
