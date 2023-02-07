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
            <div id='homePageSearchBar'>
                <input 
                    className='inputForHomePgSearch'
                    type='text' 
                    placeholder="Search Ameizin'"
                />
            </div>
            </div>
            <div className='nav-bar-right'>
                {sessionUser ? <button onClick={logout}>Sign Out</button> : <button className='hello_drop_down' onClick={() => history.push('/login')} >Sign In</button>}
                <div className='ordersLink'>Returns & Orders</div>
                <div className='cart'>Cart</div>
            </div>
        </div>
    )
};

export default Header;