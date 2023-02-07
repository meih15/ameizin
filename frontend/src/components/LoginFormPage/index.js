import React, { useState } from 'react';
import * as sessionActions from '../../store/session';
import { useDispatch, useSelector } from 'react-redux';
import { Link, Redirect, useHistory } from 'react-router-dom';
import './LoginForm.css';
import meiLogo from '../../image/meiLogo.png';

function LoginFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state.session.user);
  const [credential, setCredential] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState([]);
  const history = useHistory();

  if (sessionUser) return <Redirect to="/" />;

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.login({ credential, password }))
      .catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text(); 
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });
  }

  const handleDemoSubmit = () => {
    return dispatch(sessionActions.login({ 
      credential: 'demo@user.io', 
      password: 'password' }
  ))};

  return (
    <div className='login'>
      <div id="logoContainer">
      <Link to='/'>
        <img id='meiLogo'
             src={meiLogo}
             alt="ameizin_logo"
        />
      </Link>
      </div>
      <div className='login_container'>
        <div id='big_form'>
        <form onSubmit={handleSubmit}>
          <h1 id='signIn'>Sign in</h1>
          <ul>
            {errors.map(error => <li key={error}>{error}</li>)}
         </ul>
         {/*going to have to refactor error for error handling*/}
          <label id='email-label'>
            Email
          </label>
        
            <input
              id='emailInput'
              type="text"
              value={credential}
              onChange={(e) => setCredential(e.target.value)}
              required
            />
          
          <label id='password-label'>
            Password
          </label>
     
            <input
              id='passwordInput'
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
            <br/>
          <button type="submit" className="signin_button">Sign in</button>
        </form>
            <button onClick={(e) => handleDemoSubmit()} className="demo_login">Demo Login</button>
        </div>
        <br/>
        <div className='divider-container'>
        <h5 id='signInDivider'>New to Ameizin'?</h5>
        </div>
        <button className='login-create_button' onClick={() => history.push('/signup')}>Create your Ameizin' account</button>
      </div>
    </div>
  );
}

export default LoginFormPage;