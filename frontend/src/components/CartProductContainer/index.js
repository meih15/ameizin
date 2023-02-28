import './CartProductContainer.css';
import switch2Pic from '../../image/oled-switch.jpeg';
import { useDispatch, useSelector } from 'react-redux';
import { fetchProduct, getProduct } from '../../store/products';
import { useEffect, useState } from 'react';
import { deleteCartItem, updateCartItem } from '../../store/cartItems';
import { Link } from 'react-router-dom';



const CartProductContainer = ({cartItem}) => {
    const dispatch = useDispatch();
    const product = useSelector(getProduct(cartItem.productId));
    const [selectedQuantity, setSelectedQuantity] = useState(cartItem.quantity);


    useEffect(() => {
        dispatch(fetchProduct(cartItem.productId))
        setSelectedQuantity(cartItem.quantity)
    }, [dispatch, cartItem])

    if (!product) return <p>Loading</p>

    const handleQuantityChange = e => {
        e.preventDefault();
        const newQuantity = (parseInt(e.target.value));
        setSelectedQuantity(newQuantity);

        const cart_item = {...cartItem, quantity: newQuantity};
        dispatch(updateCartItem(cart_item));
        // setSelectedQuantity(newQuantity);
    };

    const handleDelete = e => {
        e.preventDefault();
        dispatch(deleteCartItem(cartItem.id));
    };

    const productPrice = cartItem.quantity * product.price

    let dropQuantity = [...Array(product.inventory + 1).keys()].slice(1);
    const dropdown = <select className='cart-dropdown-quantity' value={selectedQuantity} onChange={handleQuantityChange}>
                            {dropQuantity.map(qty => <option key={qty} id='dropdown-number' value={qty}>{`Qty: ${qty}`}</option> )}
                        </select>

    return(
            <div id='cart-left-side'>
                <div className='cart-product-box'>
                    <div className='left-pls'>
                    <Link to={`/products/${product.id}`}>
                        <img src={switch2Pic} id='cart-product-image' alt='cart-product'/>
                    </Link>
                    <div id='cart-product-middle-section'>
                        <Link id='name-link' to={`/products/${product.id}`}>
                            <p id='cart-product-name'>{product.productName}</p>
                        </Link>
                        <div id='cart-dynamic-stock'>
                            <p className='cart-stock-low'>{(product.inventory < 21 && product.inventory !== 0) ? `Only ${product.inventory} left in stock - order soon.` : ''}</p>
                            <p className='cart-stock-high'>{(product.inventory >= 21) ? 'In Stock' : ''}</p>
                            <p className='cart-stock-none'>{product.inventory === 0 ? 'Temporarily out of stock' : ''}</p>
                        </div>
                        <p id='cart-item-free-shipping'>Eligible for FREE Shipping</p>
                        <div id='updating-cart-section'>
                            {(product.inventory === 0) ? <p id='hide-cart-drop'>dropdown</p> : dropdown} 
                            <div id='separator-vertical'/>
                            <button id='cart-delete-button' onClick={handleDelete}>Delete</button>
                        </div>
                    </div>
                </div>
                    <div className='cart-item-price'>
                        <p id='cart-item-price-symbol'>$</p>
                        <p id='cart-item-price-whole-number-info'>{(Math.floor(productPrice)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}.</p>
                        <p id='cart-item-price-cents-info'>{Math.floor((productPrice % 1) * 100) === 0 ? '00' : Math.floor((productPrice% 1) * 100)}</p>
                    </div>
                </div>
            </div>
               
    )
};

export default CartProductContainer;