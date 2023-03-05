import csrfFetch from "./csrf";

export const RECEIVE_REVIEWS = 'RECEIVE_REVIEWS';
export const RECEIVE_REVIEW = 'RECEIVE_REVIEW';
export const REMOVE_REVIEW = 'REMOVE_REVIEW'

const receiveReviews = reviews => ({
    type: RECEIVE_REVIEWS,
    reviews
});

const receiveReview = review => ({
    type: RECEIVE_REVIEW,
    review
});

const removeReview = reviewId => ({
    type: REMOVE_REVIEW,
    reviewId
})

export const getReviews = state => {
    return state?.reviews ? Object.values(state.reviews) : [];
};

export const getReview = reviewId => state => {
    return state?.reviews ? state.reviews[reviewId] : null;
};


export const fetchReviews = () => async (dispatch) => {
    const response = await csrfFetch(`/api/reviews`);

    if (response.ok) {
        const reviews = await response.json();
        dispatch(receiveReviews(reviews));
    }
};

export const fetchReview = (review) => async (dispatch) => {
   
    const response = await csrfFetch(`/api/reviews/${review.id}`);
    
    if (response.ok) {
        
        const review = await response.json();
        dispatch(receiveReview(review));
    }
};

export const createReview = review => async (dispatch) => {

    const response = await csrfFetch(`/api/reviews`, {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({review: review})
    });

    if (response.ok) {
        const review = await response.json();
        dispatch(receiveReview(review))
    }
};


export const updateReview = review => async (dispatch) => {
    const response = await csrfFetch(`/api/reviews/${review.id}`,{
        method: 'PATCH',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({review: review})
    });

    if (response.ok) {
        const review = await response.json();
        dispatch(receiveReview(review))
    }
};

export const deleteReview = reviewId => async (dispatch) => {
    const response = await csrfFetch(`/api/reviews/${reviewId}`, {
        method: 'DELETE'
    });

    if (response.ok) {
        dispatch(removeReview(reviewId))
    }
} 

const reviewsReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_REVIEWS:
            return {...action.reviews};
        case RECEIVE_REVIEW:
            return {...state, [action.review.id]: action.review};
        case REMOVE_REVIEW:
            const newState = {...state};
            delete newState[action.reviewId];
            return newState;
        default:
            return state;
    }
};

export default reviewsReducer;