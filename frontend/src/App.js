import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LoginFormPage from './components/LoginFormPage';
import SignupFormPage from "./components/SignUpFormPage";
import Header from "./components/Header";
// import PageNotFound from './components/PageNotFound';
import ProductShowPage from './components/ProductShowPage';
// import Navigation from "./components/Navigation";


function App() {
  return (
    <>
      <Switch>
        <Route path="/login"><LoginFormPage /></Route>
        <Route path="/signup"><SignupFormPage /></Route>
        <Route path='/products/:productId'><ProductShowPage /></Route> 
        <Route exact path='/'><Header /></Route>
        {/* <Route path="*"><PageNotFound /></Route> */}
      </Switch>
    </>
  );
}

export default App;
