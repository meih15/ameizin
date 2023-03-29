import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LoginFormPage from './components/LoginFormPage';
import SignupFormPage from "./components/SignUpFormPage";
import PageNotFound from './components/PageNotFound';
import ProductShowPage from './components/ProductShowPage';
import HomePage from './components/HomePage';
import CategoryShowPage from './components/CategoryShowPage';
import CartShowPage from './components/CartShowPage';
import ConfirmationPage from './components/ConfirmationPage';
import OrderHistoryShowPage from './components/OrderHistory';
import CreateReview from './components/Reviews/CreateReview';
import ReviewConfirmation from './components/Reviews/ReviewConfirmation';
import SearchShowPage from './components/Search/SearchShowPage';



function App() {
  const isInitialLoad = localStorage.getItem('isInitialLoad');

  if (!isInitialLoad) {
    console.log("reloded")
    localStorage.setItem('isInitialLoad', 'true');
    window.location.reload();
  }

  return (
    <>
      <Switch>
        <Route path="/login"><LoginFormPage /></Route>
        <Route path="/signup"><SignupFormPage /></Route>
        <Route path='/products/:productId'><ProductShowPage /></Route>
        <Route path='/categories/:categoryId'><CategoryShowPage /></Route>
        <Route path='/orderhistory'><OrderHistoryShowPage /></Route> 
        <Route path='/order-confirmation'><ConfirmationPage /></Route>
        <Route path='/createreview'><CreateReview /></Route>
        <Route path='/review-confirmation'><ReviewConfirmation /></Route>
        <Route path='/search'><SearchShowPage /></Route>
        <Route path='/cart'><CartShowPage /></Route>
        <Route exact path='/'><HomePage /></Route>
        <Route path="*"><PageNotFound /></Route>
      </Switch>
    </>
  );
}

export default App;
