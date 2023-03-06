import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchReviews, getReviews } from '../../store/reviews';
import './ReviewShowPage.css';
import SingleReview from './SingleReview';

const ReviewShowPage = ({productId}) => {
    const dispatch = useDispatch();
    const reviews = useSelector(getReviews);

    useEffect(() => {
        dispatch(fetchReviews())
    }, [dispatch])

    const filteringReviews = (reviews, productId) => {
        Object.freeze(reviews);
        return reviews.filter(review => review.productId === productId)
    };

    const filteredReviews = filteringReviews(reviews, productId);

    const singleReview = filteredReviews.map(review => <SingleReview key={review.id} review={review}/>)

    return (
        <div className='review-show-page'>
            <div id='bar-section'>
                <p id='customer-reviews-text'>Customer reviews</p>
                {/* star and bar section */}
            </div>
            <div className='written-review-section'>
                {/* reviews with images */}
                <p>From the United States</p>
                {singleReview}
            </div>
        </div>
    )

};

export default ReviewShowPage;