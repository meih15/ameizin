import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link, useHistory, useLocation } from 'react-router-dom';
import { fetchOrderHistoryItems, getOrderHistoryItems } from '../../store/orderHistoryItems';
import CategoryNavBar from '../CategoryNavBar';
import Header from '../Header';
import './ConfirmationPage.css';
import ConfirmedProductContainer from './ConfirmedProductContainer';

const ConfirmationPage = () => {
    const location = useLocation();
    const dispatch = useDispatch();
    const history = useHistory();
    const confirmedItems = useSelector(getOrderHistoryItems);

    const confirmationNumber = new URLSearchParams(location.search).get('confirmationNumber');

    useEffect(() => {
        dispatch(fetchOrderHistoryItems())
    }, [dispatch])

    if (!confirmedItems) return <h1>Loading...</h1>


    const filteringConfirmedItems = (items, confirmationNumber) => {
        Object.freeze(items);
        return items.filter(item => item.orderConfirmation === (confirmationNumber))
    }

    const filteredConfirmedItems = filteringConfirmedItems(confirmedItems, confirmationNumber);

    const confirmedList = filteredConfirmedItems.map(item => {
        return <div key={item.id}>
                    <ConfirmedProductContainer id={`confirmed-item-box-${item.id}`} item={item}/>
                </div>
    });

    const placedProduct = confirmedList.first;

    const handleContinueShoppingClick = e => {
        e.preventDefault();
        history.push('/')
    };

    return (
        <div className='entire-confirmation-page'>
            <div id='top-of-confirm-page'>
                <Header />
                <CategoryNavBar />
            </div>
            <div id='confirmation-section'>
                <div id='order-placed-check'>
                    <i id='order-check' className="fa-solid fa-circle-check" />
                    <h1 id='thanks-message'>Order placed, thanks!</h1>
                </div>
                <div id='confirm-total-price'>
                    <div className='order-number-section'>
                        <h2 id='order-number-text'>Order:</h2>
                        <h3>#{placedProduct.orderConfirmation}</h3>
                    </div>
                    <div className='confirmed-order-total-section'>
                        <div id='confirm-order-subtotal'>
                            <h4 id='confirm-subtotal-text'>Sub-total</h4>
                            {/* price */}
                        </div>
                        <div id='tax-confirm-section'>
                            <h5 id='tax-confirm-text'>+ Tax</h5>
                            <h6 id='zero-tax'>$0.00</h6>
                        </div>
                        <div id='total-confirm'>
                            <h7 id='total-text-confirm'>Total</h7>
                            {/* price */}
                        </div>
                    </div>
                </div>
                <div className='ordered-products'>
                    {confirmedList}
                </div>
                <div>
                    <Link to='/orderhistory'>Review your orders</Link>
                    <i id='greater-than' className="fa-solid fa-greater-than"></i>
                </div>
                <button onClick={handleContinueShoppingClick} id='continue-shopping-button'>Continue shopping</button>
            </div>
        </div>
    )
};



export default ConfirmationPage;