import { useDispatch } from 'react-redux';
import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import { deleteOrderHistoryItem } from '../../store/orderHistoryItems';
import ItemHistoryContainer from './ItemHistoryContainer';
import './OrderHistoryContainer.css'

const OrderHistoryContainer = ({filteredItems, confirmationNumber, total, date}) => {
    const dispatch = useDispatch();

    const items = filteredItems.map(orderedItem => <ItemHistoryContainer key={orderedItem.id} item={orderedItem} />)
    const formattedDate = new Date(date).toLocaleDateString('en-US', {
        month: 'long',
        day: 'numeric',
        year: 'numeric'
    });

    const handleOrderHistoryDelete = e => {
        e.preventDefault();
        filteredItems.map(orderedItem => dispatch(deleteOrderHistoryItem(orderedItem.id)))
    }
    
    return (
        <>
            <div className='placed-order-container'>
                <div id='top-of-placed-order-container'>
                    <div id='two-parts'>
                        <div id='order-placed-date-section'>
                            <h1 className='placed'>ORDER PLACED</h1>
                            <h2 className='date-bought'>{formattedDate}</h2>
                        </div>
                        <div id='order-placed-total'>
                            <h3 className='placed-total'>TOTAL</h3>
                            <h4 className='total-bought'>${Number.isInteger(total) ? total.toFixed(2) : total}</h4>
                        </div>
                    </div>
                    <div id='order-placed-confirmation-number'>
                        <div id='order-confirm-num'>
                            <h5 id='order-num'>ORDER #</h5>
                            <h6>{confirmationNumber}</h6>
                        </div>
                        <Link id='link-to-details' to={`/order-confirmation?confirmationNumber=${confirmationNumber}`}>View order details</Link>
                    </div>
                </div>
                <div id='inside-box'>
                    {items}
                </div>
            </div>
            <div className='delete-order-button-div'>
                <button onClick={handleOrderHistoryDelete} id='delete-order-history'>Delete Order</button>
            </div>
        </>
    )
};

export default OrderHistoryContainer;