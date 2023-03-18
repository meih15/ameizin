import React from "react";
import './Button.css'

export const CarouselNextButton = () => {
	return (
		<button className="custom-next-button">
            <i className="fa-solid fa-angle-right"></i>
		</button>
	);
};

export const CarouselPrevButton = () => {
	return (
		<button className="custom-prev-button">
            <i className="fa-solid fa-angle-left"></i>
		</button>
	);
};