import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useLocation } from 'react-router-dom';
import { fetchOrderHistoryItems, getOrderHistoryItems } from '../../store/orderHistoryItems';
import CategoryNavBar from '../CategoryNavBar';
import Header from '../Header';
import './ConfirmationPage.css';
import ConfirmedProductContainer from './ConfirmedProductContainer';

const ConfirmationPage = () => {
    const location = useLocation();
    const dispatch = useDispatch();
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

    return (
        <div className='entire-confirmation-page'>
            <div id='top-of-confirm-page'>
                <Header />
                <CategoryNavBar />
            </div>
            <div id='confirmation-section'>
                <div className='ordered-products'>
                    {confirmedList}
                </div>
            </div>
        </div>
    )
};



export default ConfirmationPage;