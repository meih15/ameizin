import csrfFetch from "./csrf";

export const RECEIVE_CART_ITEMS = 'RECEIVE_CART_ITEMS';
export const RECEIVE_CART_ITEM = 'RECEIVE_CART_ITEM';

const receiveCartItems = cartItems => ({
    type: RECEIVE_CART_ITEMS,
    cartItems
});

const receiveCartItem = cartItem => ({
    type: RECEIVE_CART_ITEM,
    cartItem
});

export const getCartItems = state => {
    return state?.cartItems ? Object.values(state.cartItems) : [];
};

export const getCartItem = cartItemId => state => {
    return state?.cartItems ? state.cartItems[cartItemId] : null;
};


export const fetchCartItems = () => async (dispatch) => {
    const response = await csrfFetch(`/api/cartItems`);

    if (response.ok) {
        const cartItems = await response.json();
        dispatch(receiveCartItems(cartItems));
    }
};

export const fetchCartItem = (cartItem) => async (dispatch) => {
   
    const response = await csrfFetch(`/api/cartItems/${cartItem.id}`);
    
    if (response.ok) {
        
        const cartItem = await response.json();
        dispatch(receiveCartItem(cartItem));
    }
};

const cartItemsReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_CART_ITEMS:
            return {...action.cartItems};
        case RECEIVE_CART_ITEM:
            return {...state, [action.cartItem.id]: action.cartItem};
        default:
            return state;
    }
};

export default cartItemsReducer;