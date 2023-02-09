import meiWhiteLogo from '../../image/meiLogo_white.png';
import './Header.css';
import { Link, useHistory } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import * as sessionActions from '../../store/session';

function Header() {
    const history = useHistory();
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const logout = (e) => {
        e.preventDefault(); 
        dispatch(sessionActions.logout());
        };
    

    return (
        <div className='header'>
            <div className='nav-bar-left'>
                <div id="headerLogo">
                    <Link to='/'>
                        <img id='homePageHeaderLogo'
                        src={meiWhiteLogo}
                        alt="ameizin_logo"/>
                    </Link>
                </div>
            </div>
            <div className='nav-bar-middle'>
                <div></div>
                <div id='homePageSearchBar'>
                    <input 
                        className='inputForHomePgSearch'
                        type='text' 
                        placeholder="Search Ameizin'"
                    />
                </div>
            </div>
                <div className='nav-bar-right'>
                    <div className='header-profile-dropdown'>
                        <p className='hello-msg'>{ sessionUser ? `Hello, ${sessionUser.userName}` : 'Hello, sign in'}</p>
                        <div className='header-profile-hover'>
                            {sessionUser ? <button className='signout_drop_down' onClick={logout}>Sign Out</button> : <button className='signin_drop_down' onClick={() => history.push('/login')} >Sign In</button>}
                        </div>  
                    </div>
                    <Link className='ordersLink'></Link>
                        <div id='return-order'>
                            <p className='return-word'>Returns</p>
                            <p className='order-word'>& Orders</p>
                        </div>
                    <Link className='cart-section' to=''>
                        <div className='cart-section'>
                            <div id='cart-display'>
                                <div id='number-items'>1</div>
                                <i id='cart-icon' className="fa-solid fa-cart-shopping"></i>
                            </div>
                            <p id='cart-text'>Cart</p>
                        </div>
                  </Link>
                </div>
        </div>
    )
};

export default Header;