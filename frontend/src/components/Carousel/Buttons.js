import React from "react";
import './Button.css'

export const CarouselNextButton = ({name, className}) => {
	return (
		// <button className="custom-next-button">
		<button className={`custom-next-button ${name}-custom-next-button ${className}-custom-next-button`}>
            <i className="fa-solid fa-angle-right"></i>
		</button>
	);
};

export const CarouselPrevButton = ({name, className}) => {
	return (
		// <button className="custom-prev-button">
		<button className={`custom-prev-button ${name}-custom-prev-button ${className}-custom-prev-button`}>
            <i className="fa-solid fa-angle-left"></i>
		</button>
	);
};
