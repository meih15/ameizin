import csrfFetch from "./csrf";

export const RECEIVE_CARTS = 'RECEIVE_CARTS';
export const RECEIVE_CART = 'RECEIVE_CART';

const receiveCarts = carts => ({
    type: RECEIVE_CARTS,
    carts
});

const receiveCart = cart => ({
    type: RECEIVE_CART,
    cart
});

export const getCarts = state => {
    return state?.carts ? Object.values(state.carts) : [];
};

export const getCart = cartId => state => {
    return state?.carts ? state.carts[cartId] : null;
};


export const fetchCarts = () => async (dispatch) => {
    const response = await csrfFetch(`/api/carts`);

    if (response.ok) {
        const carts = await response.json();
        dispatch(receiveCarts(carts));
    }
};

export const fetchCart = (cartId) => async (dispatch) => {
   
    const response = await csrfFetch(`/api/carts/${cartId}`);
    
    if (response.ok) {
        
        const cart = await response.json();
        dispatch(receiveCart(cart));
    }
};

const cartsReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_CARTS:
            return {...action.carts};
        case RECEIVE_CART:
            return {...state, [action.cart.id]: action.cart};
        default:
            return state;
    }
};

export default cartsReducer;