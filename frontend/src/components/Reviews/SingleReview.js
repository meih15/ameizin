import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { deleteReview, updateReview } from '../../store/reviews';
import { fetchUser, getUser } from '../../store/users';
import './SingleReview.css'
import StarRating from './StarRating';

const SingleReview = ({review}) => {
    const dispatch = useDispatch();
    const user = useSelector(getUser(review.userId));
    const [editMode, setEditMode] = useState(false);
    const [updatedReview, setUpdatedReview] = useState({...review});
    const [rating, setRating] = useState(review.rating);


    useEffect (() => {
        dispatch(fetchUser(review.userId))
    }, [review]);

    const reviewDate = new Date(review.createdAt).toLocaleDateString('en-US', {
        month: 'long',
        day: 'numeric',
        year: 'numeric'
    });

    const reviewRating = (
        <div className='single-review-stars'> 
            {[1, 2, 3, 4, 5].map((num) => (
                <span key={num}>
                    {num <= rating ? (
                        <i id='filled-star-single-review' className="fa-solid fa-star"></i>
                    ) : (
                        <i id='empty-star-single-review' className="fa-regular fa-star"></i>
                    )}
                </span>
            ))}
        </div>
    );

    const handleSingleReviewDelete = e => {
        e.preventDefault();
        dispatch(deleteReview(review.id))
    };

    const handleSingleReviewUpdate = e => {
        e.preventDefault();
        setEditMode(true);
    };

    const handleUpdateSubmit = () => {
        dispatch(updateReview({...review, ...updatedReview, rating}));
        setEditMode(false);
    }

    const handleCancel = () => {
        setUpdatedReview(review);
        setEditMode(false)
    }

    if (!user) return null;

    if (editMode) {
        return (
            <div className='update-review-component'>
                <div id='review-user-info'>
                    <i id='review-pfp-icon' className="fa-solid fa-circle-user"></i>
                    <p id='review-user-name'>{user.user_name}</p>
                </div>
                <form>
                    <div className='review-edit-labels'>
                        <StarRating rating={rating} setRating={setRating}/>
                        <div id='review-update-headline-section'>
                            <label id='update-headline-text'>Headline:</label>
                            <input id='update-headline-input' type='text' value={updatedReview.headline} onChange={e => setUpdatedReview({ ...updatedReview, headline: e.target.value })} />
                        </div>
                        <div id='review-update-written-section'>
                            <label id='update-written-text'>Written Review:</label>
                            <textarea id='update-written-input' value={updatedReview.comment} onChange={(e) => setUpdatedReview({ ...updatedReview, comment: e.target.value })} />
                        </div>
                    </div>
                    <div className="update-buttons-div">
                        <div className="update-buttons">
                            <button className="review-update-button" type='button' onClick={handleUpdateSubmit}>Update</button>
                            <button className="review-cancel-button" type='button' onClick={handleCancel}>Cancel</button>
                        </div>
                    </div>
                </form>
            </div>
        )
    } else {
        return (
            <div className='review-component'>
                <div id='review-user-info'>
                    <i id='review-pfp-icon' className="fa-solid fa-circle-user"></i>
                    <p id='review-user-name'>{user.user_name}</p>
                </div>
                <div id='review-rating-headline'>
                    {reviewRating}
                    <p id='headline'>{review?.headline}</p>
                </div>
                <div id='reviewed-time'>Reviewed in the United States on {reviewDate}</div>
                <p id='comment'>{review?.comment}</p>
                {/* picture */}
                {/* helpful */}
                <div className='single-review-buttons'>
                    <div className='update-single-review-button-div'>
                        <button onClick={handleSingleReviewUpdate} id='update-single-review'>Update</button>
                    </div>            
                    <div className='delete-single-review-button-div'>
                        <button onClick={handleSingleReviewDelete} id='delete-single-review'>Delete</button>
                    </div>
                </div>
        </div>
    )}
};

export default SingleReview;