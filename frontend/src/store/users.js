import csrfFetch from "./csrf";

export const RECEIVE_USER = 'RECEIVE_USER';

const receiveUser = user => ({
    type: RECEIVE_USER,
    user
});

export const getUser = userId => state => {
    return state?.users ? state.users[userId] : null;
};

export const fetchUser = (userId) => async (dispatch) => {
    const response = await csrfFetch(`/api/users/${userId}`);

    if (response.ok) {
 
        const user = await response.json();
        dispatch(receiveUser(user));
    }
};

const usersReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_USER:
            return {...state, [action.user.id]: action.user};
        default:
            return state;
    }
};

export default usersReducer;