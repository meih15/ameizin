import meiWhiteLogo from '../../image/meiLogo_white.png';
import './Header.css';
import { Link, useHistory } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import * as sessionActions from '../../store/session';
import { fetchCart, getCart } from '../../store/carts';
import { fetchCartItems, getCartItems } from '../../store/cartItems';
import { useEffect } from 'react';

function Header() {
    const history = useHistory();
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user);
    const cart = useSelector(getCart());
    const cartItems = useSelector(getCartItems);

    const cartNumber = cartItems.reduce((total, item) => item.cartId === cart.id ? total + item.quantity : total, 0);

    const logout = (e) => {
        e.preventDefault(); 
        dispatch(sessionActions.logout());
        history.push('/login')
        };


    const signedout = (
        <>
            <button className='signin_drop_down' onClick={() => history.push('/login')} >Sign In</button>
            {/* <p>New Customer? <Link to={'/signup'}>Start Here</Link></p> */}
        </>
    )

    useEffect(() => {
        dispatch(fetchCart())
        dispatch(fetchCartItems())
    }, [dispatch]);


    return (
        <div className='header'>
            <div className='nav-bar-left'>
                <div id="headerLogo">
                    <Link className='headLogo' to='/'>
                        <img id='homePageHeaderLogo'
                        src={meiWhiteLogo}
                        alt="ameizin_logo"/>
                    </Link>
                </div>
            </div>
            <div className='nav-bar-middle'>
                <select id='searchDropDown'></select>
                <div id='homePageSearchBar'>
                    <input 
                        className='inputForHomePgSearch'
                        type='text' 
                        placeholder="Search Ameizin'"
                    />
                    <button id='searchSubmit'><i className="fa-solid fa-magnifying-glass"></i></button>
                </div>
            </div>
                <div className='nav-bar-right'>
                    <div className='header-profile-dropdown'>
                        <p className='hello-msg'>{ sessionUser ? `Hello, ${sessionUser.userName}` : 'Hello, sign in'}</p>
                        <div className='header-profile-hover'>
                            {sessionUser ? <button className='signout_drop_down' onClick={logout}>Sign Out</button> : signedout}
                        </div>  
                    </div>
                    <Link to='' className='ordersLink'></Link>
                        <div id='return-order'>
                            <p className='return-word'>Returns</p>
                            <p className='order-word'>& Orders</p>
                        </div>
                    <div id='add-hover'>
                    <Link to='/cart' className='cart-section' >
                        <div className='cart-section'>
                            <div id='cart-display'>
                                <div id='number-items'>{cartNumber}</div>
                                <i id='cart-icon' className="fa-solid fa-cart-shopping"></i>
                            </div>
                            <p id='cart-text'>Cart</p>
                        </div>
                  </Link>
                  </div>
                </div>
        </div>
    )
};

export default Header;