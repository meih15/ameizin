import { useEffect, useState } from "react";
import './TotalRating.css'

const TotalRating = ({ filteredReviews }) => {
    const [averageRating, setAverageRating] = useState(0);
    const [roundedRating, setRoundedRating] = useState(0);
    const [hasHalfStar, setHasHalfStar] = useState(false);

    useEffect(() => {
        if (!filteredReviews || filteredReviews.length === 0) {
            setAverageRating(0);
            setRoundedRating(0);
            setHasHalfStar(false);
            return;
        }

        const totalNumberReviews = filteredReviews?.length;

        const ratingTotal = filteredReviews.reduce((total, review) => {
        return total + review.rating;
        }, 0);

        const averageTotalRating = ratingTotal / totalNumberReviews;
        const roundedRating = Math.round(averageTotalRating * 2) / 2;
        const hasHalfStar = roundedRating % 1 !== 0;

        setAverageRating(averageTotalRating);
        setRoundedRating(roundedRating);
        setHasHalfStar(hasHalfStar);
    }, [filteredReviews]);

    const wholeNumberRating = Math.floor(roundedRating);

    const wholeNumberStars = wholeNumberRating > 0
        ? Array(wholeNumberRating).fill().map((_, index) => (
            <i key={index} id="filled-star-total" className="fa-solid fa-star"></i>
            )): null;

    const averageStarRating = (
        <div className="total-stars">
            {wholeNumberStars}
            {hasHalfStar && (
                <i id="half-filled-star-total" className="fa-solid fa-star-half-stroke"></i>)
            }
            {wholeNumberRating > 0
                ? Array(5 - wholeNumberRating - (hasHalfStar ? 1 : 0)).fill().map((_, index) => (
                <i key={index} id="empty-star-total" className="fa-regular fa-star"></i>)) : null
            }
        </div>
    );

    const roundedRatingFormatted = roundedRating % 1 === 0 ? `${roundedRating.toFixed(1)}` : `${roundedRating}`;

    if (!filteredReviews) return null;

    return (
        <div>
            {filteredReviews && filteredReviews.length > 0 ? (
                <div id="average-rating-section">
                    {averageStarRating}
                    <p id="rounded-rating">{roundedRatingFormatted} out of 5</p>
                </div>
            ) : (
                <div id="average-rating-section">
                    <div className='total-stars'>
                        {Array(5).fill().map((_, index) => (
                            <i key={index} id="empty-star-total" className="fa-regular fa-star"></i>
                        ))}
                    </div>
                    <p id="rounded-rating">No ratings yet</p>
                </div>
            )}
        </div>
    );
};

export default TotalRating;