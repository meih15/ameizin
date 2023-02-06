import meiLogo from '../../image/meiLogo.png';
import './Header.css';
import { Link, useHistory } from 'react-router-dom';

function Header() {
    const history = useHistory();

    return (
        <div className='header'>
            <div id="headerLogo">
                <Link to='/'>
                    <img id='homePageHeaderLogo'
                    src={meiLogo}
                    alt="ameizin_logo"/>
                </Link>
            </div>
            <div id='homePageSearchBar'>
                <input 
                    className='inputForHomePgSearch'
                    type='text' 
                    placeholder="Search Ameizin'"
                />
            </div>
            <div id='headerNavBar'>
                <button className='hello_drop_down' onClick={() => history.push('/login')} >Sign In</button>
                <div className='ordersLink'>Returns & Orders</div>
                <div className='cart'>Cart</div>
            </div>
        </div>
    )
};

export default Header;