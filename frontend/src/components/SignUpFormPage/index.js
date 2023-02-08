import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link, Redirect } from "react-router-dom";
import * as sessionActions from "../../store/session";
import './SignUpForm.css';
import meiLogo from '../../image/meiLogo.png';


function SignupFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector(state => state?.session ? state.session.user : null);
  const [email, setEmail] = useState("");
  const [user_name, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [errors, setErrors] = useState([]);

  if (sessionUser) return <Redirect to="/" />;

  const handleSubmit = (e) => {
    e.preventDefault();
    if (password === confirmPassword) {
      setErrors([]);
      return dispatch(sessionActions.signup({ email, user_name, password }))
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
    return setErrors(['Passwords must match']);
  };

  return (
    <div className="signup">
      <div id="logoContainer">
      <Link to='/'>
        <img id='meiLogo'
             src={meiLogo}
             alt="ameizin_logo"
        />
      </Link>
      </div>
    <div className="signupContainer">
    <form className='signup_form' onSubmit={handleSubmit}>
      <h1 id="createAccount">Create account</h1>
      <ul>
        {errors.map(error => <li key={error}>{error}</li>)}
      </ul>
      <label id='name-label'>
        Your name
        </label>
        <input
          id="nameInput"
          type="text"
          value={user_name}
          placeholder='First and last name'
          onChange={(e) => setUsername(e.target.value)}
          required
        />
      <label id='emailText'>
        Email
        </label>
        <input
          id="email_input"
          type="text"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
      <label id="passwordText">
        Password
        </label>
        <input
          id="password_input"
          type="password"
          placeholder="At least 6 characters"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
      <div className="alertText"> <i id='alertIcon'className="fa-solid fa-circle-info"></i> Passwords must be at least 6 characters.</div>
      <label id="password-label-2">
        Re-enter password
        </label>
        <input
          id="passwordInput2"
          type="password"
          value={confirmPassword}
          onChange={(e) => setConfirmPassword(e.target.value)}
          required
        />
      <button type="submit" className="signup_button">Continue</button>
      <div className="signup_login_redirect">Already have an account?  
          <Link id='signin-link-onlogin' to='/login'>Sign In</Link> 
          <Link id='triangleLogo' to='/login'><i className="fa-sharp fa-solid fa-caret-right"></i></Link>
      </div>
    </form>
    </div>
    </div>
  );
}

export default SignupFormPage;