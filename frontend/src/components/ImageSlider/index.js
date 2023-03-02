import './ImageSlider.css';
import React, { useState } from "react";
import { Link } from 'react-router-dom';

const ImageSlider = ({images, imageLinks}) => {
    const [currentImage, setCurrentImage] = useState(0);

    const handlePrevClick = () => {
        setCurrentImage(currentImage === 0 ? images.length - 1 : currentImage - 1);
    };

    const handleNextClick = () => {
        setCurrentImage(currentImage === images.length - 1 ? 0 : currentImage + 1);
    };

     return (
        <div className="image-slider">
            <div id='slider-button'>
                <button className="prev-button" onClick={handlePrevClick}>
                    {"<"}
                </button>
            </div>
                <Link to={imageLinks[currentImage]}>
                    <img id='background-image' src={images[currentImage]} alt="slider" />
                </Link>
            <div id='slider-button'>
                <button className="next-button" onClick={handleNextClick}>
                    {">"}
                </button>
            </div>
        </div>
  );
};

export default ImageSlider;
