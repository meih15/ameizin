import csrfFetch from "./csrf";

export const RECEIVE_CART_ITEMS = 'RECEIVE_CART_ITEMS';
export const RECEIVE_CART_ITEM = 'RECEIVE_CART_ITEM';
export const REMOVE_CART_ITEM = 'REMOVE_CART_ITEM'

const receiveCartItems = cartItems => ({
    type: RECEIVE_CART_ITEMS,
    cartItems
});

const receiveCartItem = cartItem => ({
    type: RECEIVE_CART_ITEM,
    cartItem
});

const removeCartItem = cartItemId => ({
    type: REMOVE_CART_ITEM,
    cartItemId
})

export const getCartItems = state => {
    return state?.cartItems ? Object.values(state.cartItems) : [];
};

export const getCartItem = cartItemId => state => {
    return state?.cartItems ? state.cartItems[cartItemId] : null;
};


export const fetchCartItems = () => async (dispatch) => {
    const response = await csrfFetch(`/api/cart_items`);

    if (response.ok) {
        const cartItems = await response.json();
        dispatch(receiveCartItems(cartItems));
    }
};

export const fetchCartItem = (cartItem) => async (dispatch) => {
   
    const response = await csrfFetch(`/api/cart_items/${cartItem.id}`);
    
    if (response.ok) {
        
        const cartItem = await response.json();
        dispatch(receiveCartItem(cartItem));
    }
};

export const createCartItem = cartItem => async (dispatch) => {
    const response = await csrfFetch(`/api/cart_items`, {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(cartItem)
    });

    if (response.ok) {
        const cartItem = await response.json();
        dispatch(receiveCartItem(cartItem))
    }
};

export const updateCartItem = cartItem => async (dispatch) => {
    const response = await csrfFetch(`/api/cart_items/${cartItem.id}`,{
        method: 'PATCH',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(cartItem)
    });

    if (response.ok) {
        const cartItem = await response.json();
        dispatch(receiveCartItem(cartItem))
    }
};

export const deleteCartItem = cartItemId => async (dispatch) => {
    const response = await csrfFetch(`/api/cart_items/${cartItemId}`, {
        method: 'DELETE'
    });

    if (response.ok) {
        dispatch(removeCartItem(cartItemId))
    }
} 

const cartItemsReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_CART_ITEMS:
            return {...action.cartItems};
        case RECEIVE_CART_ITEM:
            return {...state, [action.cartItem.id]: action.cartItem};
        case REMOVE_CART_ITEM:
            const newState = {...state};
            delete newState[action.cartItemId];
            return newState;
        default:
            return state;
    }
};

export default cartItemsReducer;