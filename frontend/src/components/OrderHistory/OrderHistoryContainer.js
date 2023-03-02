import ItemHistoryContainer from './ItemHistoryContainer';
import './OrderHistoryContainer.css'

const OrderHistoryContainer = ({filteredItems, confirmationNumber, total, date}) => {
    const items = filteredItems.map(orderedItem => <ItemHistoryContainer key={orderedItem.id} item={orderedItem} />)

    
    return (
        <div className='placed-order-container'>
            <div id='top-of-placed-order-container'>
                <div id='order-placed-date-section'>
                    <h1>ORDER PLACED</h1>
                    <h2>{date}</h2>
                </div>
                <div id='order-placed-total'>
                    <h3>TOTAL</h3>
                    <h4>{total}</h4>
                </div>
                <div id='order-placed-confirmation-number'>
                    <h5>ORDER #</h5>
                    <h6>{confirmationNumber}</h6>
                </div>
            </div>
            {items}
        </div>
    )
};

export default OrderHistoryContainer;