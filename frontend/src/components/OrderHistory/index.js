import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchOrderHistoryItems, getOrderHistoryItems } from '../../store/orderHistoryItems';
import CategoryNavBar from '../CategoryNavBar';
import Header from '../Header';
import './OrderHistory.css';

const OrderHistoryShowPage = () => {
    const dispatch = useDispatch();
    const orders = useSelector(getOrderHistoryItems);

    useEffect(() => {
        dispatch(fetchOrderHistoryItems())
    }, [dispatch])


    if (!orders) return <p>Loading...</p>

    // const orderExist = (orders.length === 0)

        return (
            <div className='order-history-page'>
                <div id='top-order-history'>
                    <Header />
                    <CategoryNavBar />
                </div>
                <div id='order-history-section'>
                    {/* {!orderExist ? <p>Looks like you haven't placed an order yet.</p> : {}} */}
                </div>
            </div>
        )

};

export default OrderHistoryShowPage;