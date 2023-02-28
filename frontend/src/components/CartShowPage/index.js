import { useDispatch, useSelector } from 'react-redux';
import { getCart, fetchCart } from '../../store/carts';
import { useEffect} from 'react';
import Header from '../Header';
import './CartShowPage.css'
import CategoryNavBar from '../CategoryNavBar';
import CartProductContainer from '../CartProductContainer';
import { deleteCartItem, fetchCartItems, getCartItems } from '../../store/cartItems';
import { Link, useHistory } from 'react-router-dom';
import { fetchProducts, getProducts, updateProduct } from '../../store/products';
import { createOrderHistoryItem } from '../../store/orderHistoryItems';


const CartShowPage = () => {
    const dispatch = useDispatch();
    const cart = useSelector(getCart());
    const allItems = useSelector(getCartItems);
    const products = useSelector(getProducts);
    const history = useHistory();
    const currentUser = useSelector(state => state.session.user);

    
    useEffect(() => {
        dispatch(fetchCart())
        dispatch(fetchCartItems())
        dispatch(fetchProducts())
    }, [dispatch])

    if (!cart) return <h1>Loading...</h1>

    const filteringItems = (items, cartId) => {
        Object.freeze(items);
        return items.filter(item => item.cartId === cartId)
    }

    const filteredCartItems = filteringItems(allItems, cart.id)
    const totalItems = allItems.reduce((total, item) => item.cartId === cart.id ? total + item.quantity : total, 0);

    const emptyCart = <h2 className='empty-cart'>Your Ameizin' Cart is empty</h2>

    const itemList = filteredCartItems.map(item => {
        return <div key={item.id}>
                    <CartProductContainer id={`cart-item-box-${item.id}`} cartItem={item}/>
                </div>
    });


    const cartTotal = filteredCartItems.reduce((total, item) => {
        const product = products.find(product => product.id === item.productId);
        if (product) {
            return total + (item.quantity * product.price);
        }
            return total;
        }, 0);
        


    const handleCheckout = e => {
        e.preventDefault();
        if (currentUser) {
            const confirmationNumber = Math.floor(Math.random() * 999999999999);

            filteredCartItems.forEach(item => { 
                const product = products.find(product => product.id === item.productId);  
                dispatch(createOrderHistoryItem({
                    userId: cart.userId,
                    productId: item.productId,
                    quantity: item.quantity,
                    itemTotal: (item.quantity * product.price),
                    orderTotal: cartTotal,
                    orderConfirmation: confirmationNumber
                }));
                dispatch(updateProduct({...product, inventory: (product.inventory - item.quantity)}))
                dispatch(deleteCartItem(item.id))
            });
            history.replace(`/order-confirmation?confirmationNumber=${confirmationNumber}`);
        } else {
            history.push('/login');
        }
    };
    
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
                        <div id='top-of-middle-section'>
                            <h1 className='shopping-cart-text'>Shopping Cart</h1>
                            <p id='middle-section-price'>Price</p>
                        </div>
                        <div id='cart-break'/>
                        <div id='cart-items-section'>
                            {itemList}
                        </div>
                        <div id='bottom-cart-break'/>
                        <div id='subtotal-section'>
                            { totalItems > 1 ? <p id='subtotals'>Subtotal ({totalItems} items): </p> : <p id='subtotals'>Subtotal (1 item): </p>}
                             <div className='subtotal-price'>
                                <p id='subtotal-price-symbol'>$</p>
                                <p id='subtotal-price-whole-number-info'>{(Math.floor(cartTotal)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}.</p>
                                <p id='subtotal-price-cents-info'>{Math.floor((cartTotal % 1) * 100) === 0 ? '00' : Math.floor((cartTotal % 1) * 100)}</p>
                            </div>
                        </div>
                    </div>
                    <div id='checkout-section'>
                        <h2 id='order-text'>Order Summary</h2>
                        <div className='cart-summary-text'>
                            <div id='total-items'>
                                { totalItems > 1 ? <p id='item-nums'>Items ({totalItems}):</p> : <p id='item-nums'>Items:</p>}
                                <div className='summary-price'>
                                    <p id='summary-price-symbol'>$</p>
                                    <p id='summary-price-whole-number-info'>{(Math.floor(cartTotal)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}.</p>
                                    <p id='summary-price-cents-info'>{Math.floor((cartTotal % 1) * 100) === 0 ? '00' : Math.floor((cartTotal % 1) * 100)}</p>
                                </div>
                            </div>
                            <div id='shipping-section'>
                                <p id='s-and-h'>Shipping & handling:</p>
                                <p id='s-and-h-price'>--</p>
                            </div>
                            <div id='order-top-break'/>
                            <div id='tax-section'>
                                <p id='total'>Total before tax:</p>
                                <div className='summary-price'>
                                    <p id='summary-price-symbol'>$</p>
                                    <p id='summary-price-whole-number-info'>{(Math.floor(cartTotal)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}.</p>
                                    <p id='summary-price-cents-info'>{Math.floor((cartTotal % 1) * 100) === 0 ? '00' : Math.floor((cartTotal % 1) * 100)}</p>
                                </div>
                            </div>
                            <div id='tax-collected'>
                                <p id='tax-text'>Estimated tax to be collected:</p>
                                <p id='tax-price'>--</p>
                            </div>
                            <div id='order-top-break'/>
                        </div>
                        <div className='order-total-section'>
                            <p id='order-total-text'>Order total:</p>
                            <div className='total-price'>
                                <p id='total-price-symbol'>$</p>
                                <p id='total-price-whole-number-info'>{(Math.floor(cartTotal)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}.</p>
                                <p id='total-price-cents-info'>{Math.floor((cartTotal % 1) * 100) === 0 ? '00' : Math.floor((cartTotal % 1) * 100)}</p>
                            </div>
                        </div>
                        <button id='checkout-button' onClick={handleCheckout}>Checkout</button>
                    </div>
                </div>

            </div>
        )}

};



export default CartShowPage;