import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchUser, getUser } from '../../store/users';
import './SingleReview.css'

const SingleReview = ({review}) => {
    const dispatch = useDispatch();
    const user = useSelector(getUser(review.userId));
    debugger
    useEffect (() => {
        dispatch(fetchUser(review.userId))
    }, [dispatch, review.userId]);

    const reviewDate = new Date(review.createdAt).toLocaleDateString('en-US', {
        month: 'long',
        day: 'numeric',
        year: 'numeric'
    });

    if (!user) return null;


    return (
        <div className='review-component'>
            <div id='user-info'>
                {/* user pfp */}
                <p>{user.user_name}</p>
            </div>
            <div id='review-rating-headline'>
                {/* rating */}
                <p id='headline'>{review?.headline}</p>
            </div>
            <div id='reviewed-time'>Reviewed in the United States on {reviewDate}</div>
            <p id='comment'>{review?.comment}</p>
            {/* picture */}
            {/* helpful */}
        </div>
    )
};

export default SingleReview;