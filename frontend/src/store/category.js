import csrfFetch from "./csrf";

export const RECEIVE_CATEGORIES = 'RECEIVE_CATEGORIES';
export const RECEIVE_CATEGORY = 'RECEIVE_CATEGORY';

const receiveCategories = categories => ({
    type: RECEIVE_CATEGORIES,
    categories
});

const receiveCategory = category => ({
    type: RECEIVE_CATEGORY,
    category
});

export const getCategories = state => {
    return state?.categories ? Object.values(state.categories) : [];
};

export const getCategory = categoryId => state => {
    return state?.categories ? state.categories[categoryId] : null;
};


export const fetchCategories = () => async (dispatch) => {
    const response = await csrfFetch(`/api/categories`);

    if (response.ok) {
        const categories = await response.json();
        dispatch(receiveCategories(categories));
    }
};

export const fetchCategory = (categoryId) => async (dispatch) => {
    const response = await csrfFetch(`/api/categories/${categoryId}`);

    if (response.ok) {
        const category = await response.json();
        dispatch(receiveCategory(category));
    }
};

const categoriesReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_CATEGORIES:
            return {...action.categories};
        case RECEIVE_CATEGORY:
            return {...state, [action.category.id]: action.category};
        default:
            return state;
    }
};

export default categoriesReducer;