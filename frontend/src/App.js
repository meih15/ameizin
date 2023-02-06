import React from 'react';
import { Route, Switch } from 'react-router-dom';
import LoginFormPage from './components/LoginFormPage';
import SignupFormPage from "./components/SignUpFormPage";
import Header from "./components/Header";
// import Navigation from "./components/Navigation";


function App() {
  return (
    <>
      <Switch>
        <Route path="/login"><LoginFormPage /></Route>
        <Route path="/signup"><SignupFormPage /></Route>
        <Route path='/'><Header /></Route>
      </Switch>
    </>
  );
}

export default App;
