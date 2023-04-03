import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link, useHistory, useLocation } from 'react-router-dom';
import { fetchOrderHistoryItems, getOrderHistoryItems } from '../../store/orderHistoryItems';
import CategoryNavBar from '../CategoryNavBar';
import Footer from '../Footer/Footer';
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
    }, [])


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

    const placedProduct = filteredConfirmedItems[0];
    const handleContinueShoppingClick = e => {
        e.preventDefault();
        history.push('/')
    };

    if (!confirmationNumber) return null;
    if (!confirmedItems) return <h1>Loading...</h1>
    
    return (
        <div className='entire-confirmation-page'>
            <div id='top-of-confirm-page'>
                <Header />
                <CategoryNavBar />
            </div>
            <div className='center-pls'>
                <div id='confirmation-section'>
                    <div id='order-placed-check'>
                        <i id='order-check' className="fa-solid fa-circle-check" />
                        <h1 id='thanks-message'>Order placed, thanks!</h1>
                    </div>
                    <div id='thanks-break'/>
                    <div id='confirm-total-price'>
                        <div className='order-number-section'>
                            <h2 id='order-number-text'>Order:</h2>
                            <h3 id='order-number' >#{placedProduct?.orderConfirmation}</h3>
                        </div>
                        <div className='confirmed-order-total-section'>
                            <div id='confirm-order-subtotal'>
                                <h4 id='confirm-subtotal-text'>Sub-total</h4>
                                <div className='confirmed-subtotal-item-price'>
                                    <p id='confirmed-subtotal-symbol'>$</p>
                                    <p id='confirmed-subtotal-whole-number-info'>{(Math.floor(placedProduct?.orderTotal)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}.</p>
                                    <p id='confirmed-subtotal-cents-info'>{Math.floor((placedProduct?.orderTotal % 1) * 100) === 0 ? '00' : Math.floor((placedProduct?.orderTotal % 1) * 100).toString()}</p>
                                </div>
                            </div>
                            <div id='tax-confirm-section'>
                                <h5 id='tax-confirm-text'>+ Tax</h5>
                                <h6 id='zero-tax'>$0.00</h6>
                            </div>
                            <div id='total-confirm'>
                                <p id='total-text-confirm'>Total</p>
                                <div className='confirmed-total-item-price'>
                                    <p id='confirmed-total-symbol'>$</p>
                                    <p id='confirmed-total-whole-number-info'>{(Math.floor(placedProduct?.orderTotal)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}.</p>
                                    <p id='confirmed-total-cents-info'>{Math.floor((placedProduct?.orderTotal % 1) * 100) === 0 ? '00' : Math.floor((placedProduct?.orderTotal % 1) * 100).toString()}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id='thanks-break'/>
                    <div className='ordered-products'>
                        {confirmedList}
                    </div>
                    <div id='confirm-review'>
                        <Link id='review-confirm' to='/orderhistory'>Review your orders</Link>
                        <i id='greater-than' className="fa-solid fa-greater-than"></i>
                    </div>
                    <div id='thanks-break'/>
                    <div id='confirm-button'>
                        <button onClick={handleContinueShoppingClick} id='continue-shopping-button'>Continue shopping</button>
                    </div>
                    <div id='thanks-break'/>
                    <div id='done-shopping-section'>
                        <p className='done'>Done Shopping?</p>
                        <p className='check-it'>Check out these Ameizin' links:</p>
                        <div className='done-links'>
                            <p id='portfolio-link'>Portfolio</p>
                            <a id='github-link' href='https://github.com/meih15/ameizin' target='_blank' rel="noreferrer">Github</a>
                            <a id='linkedin-link' href='https://www.linkedin.com/in/mei-huang-ba967a159' target='_blank' rel="noreferrer">Linkedin</a>
                            <div className='description-link'>
                                <a id='js-link' href='https://meih15.github.io/bobabreak/' target='_blank' rel="noreferrer">bobabreak</a>
                                <p id='des'>Javascript Project</p>
                            </div>
                            <div className='description-link'>
                                <a id='m-link' href='https://puppy-play-dates.herokuapp.com/' target='_blank' rel="noreferrer">Puppy Play Dates</a>
                                <p id='des'>MERN Stack Project</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <Footer />
        </div>
    )
};
export default ConfirmationPage;