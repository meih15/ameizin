import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useHistory } from 'react-router-dom/cjs/react-router-dom.min';
import { fetchReviews, getReviews } from '../../store/reviews';
import './ReviewShowPage.css';
import SingleReview from './SingleReview';
import TotalRating from './TotalRating';

const ReviewShowPage = ({productId}) => {
    const dispatch = useDispatch();
    const history = useHistory();
    const reviews = useSelector(getReviews);

    useEffect(() => {
        dispatch(fetchReviews())
    }, [dispatch])

    const filteringReviews = (reviews, productId) => {
        Object.freeze(reviews);
        return reviews.filter(review => review.productId === parseInt(productId))
    };

    const handleWriteReview = e => {
        e.preventDefault();
        history.push(`/createreview?productId=${productId}`);
    }

    if (!reviews) return null;


    const filteredReviews = filteringReviews(reviews, productId);
    const sortedReviews = [...filteredReviews].sort((a, b) => b.createdAt.localeCompare(a.createdAt));
    const singleReview = sortedReviews.map(review => <SingleReview key={review.id} review={review}/>)
    // still need to order these reviews liek i did orderhistory items


    return (
        <div className='review-show-page'>
            <div id='bar-section'>
                <p id='customer-reviews-text'>Customer reviews</p>
                <TotalRating filteredReviews={filteredReviews}/>
                <div id="review-rating-break" />
                <p id='review-this-product'>Review this product</p>
                <p id='share-thoughts'>Share your thoughts with other customers</p>
                <button id='write-review-button' onClick={handleWriteReview}>Write a customer review</button>
                <div id="review-rating-break" />
                {/*bar section */}
            </div>
            <div className='written-review-section'>
                {/* reviews with images */}
                <p id='from-us'>From the United States</p>
                {singleReview}
            </div>
        </div>
    )

};

export default ReviewShowPage;