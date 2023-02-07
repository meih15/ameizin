import csrfFetch from "./csrf";

export const RECEIVE_PRODUCTS = 'RECEIVE_PRODUCTS';
export const RECEIVE_PRODUCT = 'RECEIVE_PRODUCT';

const receiveProducts = products => ({
    type: RECEIVE_PRODUCTS,
    products
});

const receiveProduct = product => ({
    type: RECEIVE_PRODUCT,
    product
});

export const getProducts = state => {
    return state?.products ? Object.values(state.products) : [];
};

export const getProduct = productId => state => {
    return state?.products ? state.products[productId] : null;
};


export const fetchProducts = () => async (dispatch) => {
    const response = await csrfFetch(`api/products`);

    if (response.ok) {
        const products = await response.json();
        dispatch(receiveProducts(products));
    }
};

export const fetchProduct = (productId) => async (dispatch) => {
    const response = await csrfFetch(`api/products/${productId}`);

    if (response.ok) {
        const product = await response.json();
        dispatch(receiveProduct(product));
    }
};

const productsReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_PRODUCTS:
            return {...action.products};
        case RECEIVE_PRODUCT:
            return {...state, [action.product.id]: action.product};
        default:
            return state;
    }
};

export default productsReducer;