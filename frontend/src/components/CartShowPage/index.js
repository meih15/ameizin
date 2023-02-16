import { useDispatch, useSelector } from 'react-redux';
import { getCart, fetchCart } from '../../store/carts';
import { useEffect} from 'react';
import Header from '../Header';
import './CartShowPage.css'
import CategoryNavBar from '../CategoryNavBar';
import CartProductContainer from '../CartProductContainer';
import { fetchCartItems, getCartItems } from '../../store/cartItems';
import { Link } from 'react-router-dom';



const CartShowPage = () => {
    const dispatch = useDispatch();
    const cart = useSelector(getCart());
    const allItems = useSelector(getCartItems);
    
    useEffect(() => {
        dispatch(fetchCart())
        dispatch(fetchCartItems())
    }, [dispatch])

    if (!cart) return <h1>Loading...</h1>

    const filteringItems = (items, cartId) => {
        Object.freeze(items);
        return items.filter(item => item.cartId === cartId)
    }

    const filteredCartItems = filteringItems(allItems, cart.id)
    const totalItems = filteredCartItems.length

    const emptyCart = <h2 className='empty-cart'>Your Ameizin' Cart is empty</h2>

    const itemList = filteredCartItems.map(item => {
        return <div key={item.id}>
                    <CartProductContainer id={`cart-item-box-${item.id}`} cartItem={item}/>
                </div>
    });

    
    if (filteredCartItems.length === 0) {
        return (
            <div className='empty-whole-cart'>
                <div id='top-of-cart-page'>
                    <Header />
                    <CategoryNavBar />
                </div>
                <div id='cart-box'>
                    {emptyCart}
                    <p id='live-to-serve'>Your Shopping Cart lives to serve. Give it purpose — fill it with groceries, books, beauty supplies, electronics, and more.</p>
                    <div id='continue-shopping'>Continue shopping on the <Link id='cart-link-to-home' to='/'>Ameizin' homepage</Link></div>
                </div>
            </div>
            )
    } else {
        return (
            <div className='entire-cart-page'>
                <div id='top-of-cart-page'>
                    <Header />
                    <CategoryNavBar />
                </div>
                <div className='cart-show-page'>
                    <div id='middle-cart-page'>
                        <h1 className='shopping-cart-text'>Shopping Cart</h1>
                        <div id='cart-items-section'>
                            {itemList}
                        </div>
                    </div>
                    <div id='checkout-section'>
                        <h2>Order Summary</h2>
                        <div className='cart-summary-text'>
                            <div id='total-items'>
                                { totalItems > 1 ? <p id='item-nums'>Items ({totalItems}):</p> : <p id='one-item'>Items:</p>}
                                {/* order total */}
                            </div>
                            <div id='shipping-section'>
                                <p id='s-and-h'>Shipping & handling:</p>
                                <p id='s-and-h-price'>$0.00</p>
                            </div>
                            <div id='tax-section'>
                                <p id='total'>Total before tax:</p>
                                {/* order total */}
                            </div>
                            <div id='tax-collected'>
                                <p id='tax-text'>Estimated tax to be collected:</p>
                                <p id='tax-price'>$0.00</p>
                            </div>
                        </div>
                        <div className='order-total-section'>
                            <p id='order-text'>Order total:</p>
                            {/* order total */}
                        </div>
                        <button id='checkout-button'>Checkout</button>
                    </div>
                </div>

            </div>
        )}

};

export default CartShowPage;