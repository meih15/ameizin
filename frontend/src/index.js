import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { BrowserRouter } from 'react-router-dom';
import './reset.css';
import './index.css';
import App from './App';
import configureStore from './store';
import csrfFetch from './store/csrf';
import * as sessionActions from './store/session';
import * as cartActions from './store/carts';
import * as cartItemActions from './store/cartItems';
import * as productActions from './store/products';
import * as categoryActions from './store/category';
import * as orderHistoryItemActions from './store/orderHistoryItems';
import * as reviewActions from './store/reviews';
import * as userActions from './store/users'


const store = configureStore();

if (process.env.NODE_ENV !== 'production') {
  window.store = store;
  window.csrfFetch = csrfFetch;
  window.sessionActions = sessionActions;
  window.productActions = productActions;
  window.categoryActions = categoryActions;
  window.cartActions = cartActions;
  window.cartItemActions = cartItemActions;
  window.orderHistoryItemActions = orderHistoryItemActions;
  window.reviewActions = reviewActions;
  window.userActions = userActions;
};


const renderApplication = () => {
  ReactDOM.render(
    <React.StrictMode>
      <Root />
    </React.StrictMode>,
    document.getElementById('root')
  );
};

if (
  sessionStorage.getItem("currentUser") === null || sessionStorage.getItem("X-CSRF-Token") === null 
) {
  store.dispatch(sessionActions.restoreSession()).then(renderApplication);
} else {
  renderApplication();
}

function Root() {
  return (
    <Provider store={store}>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </Provider>
  );
};

