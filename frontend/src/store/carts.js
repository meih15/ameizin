import csrfFetch from "./csrf";


export const RECEIVE_CART = 'RECEIVE_CART';

const receiveCart = cart => ({
    type: RECEIVE_CART,
    cart
});


export const getCart = () => state => {
    return state?.cart ? state.cart : null;
};


export const fetchCart = () => async (dispatch) => {
   
    const response = await csrfFetch(`/api/cart`);
    
    if (response.ok) {
        
        const cart = await response.json();
        dispatch(receiveCart(cart));
    }
};

const cartsReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_CART:
            return {...state, [action.cart]: action.cart};
        default:
            return state;
    }
};

export default cartsReducer;