import csrfFetch from "./csrf";

export const RECEIVE_ORDER_HISTORY_ITEMS = 'RECEIVE_ORDER_HISTORY_ITEMS';
export const RECEIVE_ORDER_HISTORY_ITEM = 'RECEIVE_ORDER_HISTORY_ITEM';
export const REMOVE_ORDER_HISTORY_ITEM = 'REMOVE_ORDER_HISTORY_ITEM'

const receiveOrderHistoryItems = orderHistoryItems => ({
    type: RECEIVE_ORDER_HISTORY_ITEMS,
    orderHistoryItems
});

const receiveOrderHistoryItem = orderHistoryItem => ({
    type: RECEIVE_ORDER_HISTORY_ITEM,
    orderHistoryItem
});

const removeOrderHistoryItem = orderHistoryItemId => ({
    type: REMOVE_ORDER_HISTORY_ITEM,
    orderHistoryItemId
})

export const getOrderHistoryItems = state => {
    return state?.orderHistoryItems ? Object.values(state.orderHistoryItems) : [];
};

export const getOrderHistoryItem = orderHistoryItemId => state => {
    return state?.orderHistoryItems ? state.orderHistoryItems[orderHistoryItemId] : null;
};


export const fetchOrderHistoryItems = () => async (dispatch) => {
    const response = await csrfFetch(`/api/order_history_items`);

    if (response.ok) {
        const orderHistoryItems = await response.json();
        dispatch(receiveOrderHistoryItems(orderHistoryItems));
    }
};

export const fetchOrderHistoryItem = (orderHistoryItem) => async (dispatch) => {
   
    const response = await csrfFetch(`/api/order_history_items/${orderHistoryItem.id}`);
    
    if (response.ok) {
        
        const orderHistoryItem = await response.json();
        dispatch(receiveOrderHistoryItem(orderHistoryItem));
    }
};

export const createOrderHistoryItem = orderHistoryItem => async (dispatch) => {
    const response = await csrfFetch(`/api/order_history_items`, {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(orderHistoryItem)
    });

    if (response.ok) {
        const orderHistoryItem = await response.json();
        dispatch(receiveOrderHistoryItem(orderHistoryItem))
    }
};


export const updateCartItem = orderHistoryItem => async (dispatch) => {
    const response = await csrfFetch(`/api/order_history_items/${orderHistoryItem.id}`,{
        method: 'PATCH',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(orderHistoryItem)
    });

    if (response.ok) {
        const orderHistoryItem = await response.json();
        dispatch(receiveOrderHistoryItem(orderHistoryItem))
    }
};

export const deleteCartItem = orderHistoryItemId => async (dispatch) => {
    const response = await csrfFetch(`/api/order_history_items/${orderHistoryItemId}`, {
        method: 'DELETE'
    });

    if (response.ok) {
        dispatch(removeOrderHistoryItem(orderHistoryItemId))
    }
} 

const orderHistoryItemsReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_ORDER_HISTORY_ITEMS:
            return {...action.orderHistoryItems};
        case RECEIVE_ORDER_HISTORY_ITEM:
            return {...state, [action.orderHistoryItem.id]: action.orderHistoryItem};
        case REMOVE_ORDER_HISTORY_ITEM:
            const newState = {...state};
            delete newState[action.orderHistoryItemId];
            return newState;
        default:
            return state;
    }
};

export default orderHistoryItemsReducer;