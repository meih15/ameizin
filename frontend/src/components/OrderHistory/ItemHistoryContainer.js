import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link, useHistory } from 'react-router-dom';
import switch2Pic from '../../image/oled-switch.jpeg';
import { fetchProduct, getProduct } from '../../store/products';
import './ItemHistoryContainer.css';

const ItemHistoryContainer = ({item}) => {
    const dispatch = useDispatch();
    const product = useSelector(getProduct(item.productId));
    const history = useHistory();

    useEffect(() => {
        dispatch(fetchProduct(item.productId))
    }, [dispatch])

    const handleViewClick = e => {
        e.preventDefault();
        history.push(`/order-confirmation?confirmationNumber=${item.orderConfirmation}`);
    }

    if (!product) return <p>Loading...</p>

    return (
        <div className='placed-product-section'>
            <Link to={`/products/${product.id}`}>
                <img src={switch2Pic} id='history-product-image' alt='history-product'/>
            </Link>
            <Link id='name-link' to={`/products/${product.id}`}>
                <p id='history-product-name'>{product.productName}</p>
            </Link>
            <div className='button-section'>
                <button onClick={handleViewClick}>View Order</button>
                {/* write reviews button */}
            </div>
        </div>
    )
};

export default ItemHistoryContainer;