import { useEffect, useState} from "react";
import './ProductRating.css'

const ProductRating = ({filteredReviews}) => {
    const [averageRating, setAverageRating] = useState(0);
    const [roundedRating, setRoundedRating] = useState(0);
    const [hasHalfStar, setHasHalfStar] = useState(false);


    useEffect(() => {
        if (!filteredReviews || filteredReviews.length === 0) {
            setAverageRating(0);
            setRoundedRating(0);
            setHasHalfStar(false);
        } else {
            const totalNumberReviews = filteredReviews.length;
            const ratingTotal = filteredReviews.reduce((total, review) => {
                return total + review.rating;
            }, 0);
            const averageTotalRating = ratingTotal / totalNumberReviews;
            const calcRoundedRating = Math.round(averageTotalRating * 2) / 2;
            const ifHasHalfStar = calcRoundedRating % 1 !== 0;

            setAverageRating(averageTotalRating);
            setRoundedRating(calcRoundedRating);
            setHasHalfStar(ifHasHalfStar);
        }
    }, [filteredReviews]);

    const wholeNumberRating = Math.floor(roundedRating);

    const wholeNumberStars = wholeNumberRating > 0
        ? Array(wholeNumberRating).fill().map((_, index) => (
            <i key={index} id="filled-star-search" className="fa-solid fa-star"></i>
            )): null;

    const averageStarRating = (
        <div className="total-search-stars">
            {wholeNumberStars}
            {hasHalfStar && (
                <i id="half-filled-star-search" className="fa-solid fa-star-half-stroke"></i>)
            }
            {wholeNumberRating > 0
                ? Array(5 - wholeNumberRating - (hasHalfStar ? 1 : 0)).fill().map((_, index) => (
                <i key={index} id="empty-star-search" className="fa-regular fa-star"></i>)) : null
            }
        </div>
    );

    const roundedRatingFormatted = roundedRating % 1 === 0 ? `${roundedRating.toFixed(1)}` : `${roundedRating}`;


    return (
        <div id="entire-search-rating">
            {filteredReviews && filteredReviews.length > 0 ? (
                <div id="search-average-rating-section">
                    <p id="search-rounded-rating">{roundedRatingFormatted}</p>
                    {averageStarRating}
                </div>
            ) : (
                <div id="search-average-rating-section">
                    <p id="search-rounded-rating">No ratings yet</p>
                    {Array(5).fill().map((_, index) => (
                        <i key={index} id="empty-star-search" className="fa-regular fa-star"></i>
                    ))}
                </div>
            )}
            {/* total ratings */}
        </div>
    );
};

export default ProductRating;
