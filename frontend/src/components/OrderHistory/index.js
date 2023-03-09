import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchOrderHistoryItems, getOrderHistoryItems } from '../../store/orderHistoryItems';
import CategoryNavBar from '../CategoryNavBar';
import Header from '../Header';
import './OrderHistory.css';
import OrderHistoryContainer from './OrderHistoryContainer';

const OrderHistoryShowPage = () => {
    const dispatch = useDispatch();
    const orders = useSelector(getOrderHistoryItems);

    useEffect(() => {
        dispatch(fetchOrderHistoryItems())
    }, [dispatch])

    if (!orders) return <p>Loading...</p>

    const orderExist = (orders.length === 0)
    const sortedOrders = [...orders].sort((a, b) => b.createdAt.localeCompare(a.createdAt));
    const orderConfirmations = [...new Set(sortedOrders.map(order => order.orderConfirmation))];

    const filteringItems = (items, orderConfirmation) => {
        Object.freeze(items);
        return items.filter(item => item.orderConfirmation === orderConfirmation)
    }

    const placedOrder = orderConfirmations.map(confirmation => {
        const filtered = filteringItems(orders, confirmation)
        const orderItemInfo = filtered[0]
        return <OrderHistoryContainer key={confirmation} filteredItems={filtered} confirmationNumber={confirmation} total={orderItemInfo?.orderTotal} date={orderItemInfo?.createdAt}/>
    })


        return (
            <div className='order-history-page'>
                <div id='top-order-history'>
                    <Header />
                    <CategoryNavBar />
                </div>
                <div id='order-div'>
                    <div id='order-history-section'>
                        <h1 id='order-title'>Your Orders</h1>
                        <div id='history-break'/>
                        {orderExist ? <p className='empty-order-history'>Looks like you haven't placed an order yet.</p> : placedOrder}
                    </div>
                </div>
            </div>
        )

};

export default OrderHistoryShowPage;