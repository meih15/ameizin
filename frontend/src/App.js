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
// import Header from "./components/HomePage";
// import Navigation from "./components/Navigation";


function App() {
  return (
    <>
      <Switch>
        <Route path="/login"><LoginFormPage /></Route>
        <Route path="/signup"><SignupFormPage /></Route>
        <Route path='/products/:productId'><ProductShowPage /></Route>
        <Route path='/categories/:categoryId'><CategoryShowPage /></Route>
        <Route path='/orderhistory'><OrderHistoryShowPage /></Route> 
        <Route path='/order-confirmation'><ConfirmationPage /></Route>
        <Route path='/cart'><CartShowPage /></Route>
        <Route exact path='/'><HomePage /></Route>
        <Route path="*"><PageNotFound /></Route>
      </Switch>
    </>
  );
}

export default App;
