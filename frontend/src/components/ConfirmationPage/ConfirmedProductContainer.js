import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link } from 'react-router-dom';
import { fetchProduct, getProduct } from '../../store/products';
import switch2Pic from '../../image/oled-switch.jpeg';
import './ConfirmedProductContainer.css';

const ConfirmedProductContainer = ({item}) => {
    const dispatch = useDispatch();
    const product = useSelector(getProduct(item.productId));

    useEffect(() => {
        dispatch(fetchProduct(item.productId))
    }, [dispatch])

    if (!item) return <p>Loading</p>
    if(!product) return <p>Loading</p>

    return (
        <div className='confirmed-item-container'>
            <div id='confirmed-item-left-side'>
                <Link to={`/products/${product.id}`}>
                    <img src={switch2Pic} id='confirmed-product-image' alt='confirmed-product'/>
                </Link>
                <div id='confirmed-product-middle-section'>
                    <div id='product-name-confirmed'>
                        <Link id='confirmed-name-link' to={`/products/${product.id}`}>
                            <p id='confirmed-product-name'>{product.productName}</p>
                        </Link>
                        <p id='confirmed-item-qty'>x{item.quantity}</p>
                    </div>
                    <p id='sold-by-text'>Sold by Ameizin'</p>
                </div>
            </div>
            <div className='confirmed-item-price'>
                <p id='confirmed-item-price-symbol'>$</p>
                <p id='confirmed-item-price-whole-number-info'>{(Math.floor(item.itemTotal)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}.</p>
                <p id='confirmed-item-price-cents-info'>{Math.floor((item.itemTotal % 1) * 100) === 0 ? '00' : Math.floor((item.itemTotal % 1) * 100)}</p>
            </div>
        </div>
    )
};

export default ConfirmedProductContainer;