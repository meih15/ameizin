import { useDispatch, useSelector } from 'react-redux';
import { getCart, fetchCart } from '../../store/carts';
import { useEffect} from 'react';
import Header from '../Header';
import './CartShowPage.css'
import CategoryNavBar from '../CategoryNavBar';
import CartProductContainer from '../CartProductContainer';
import { fetchCartItems, getCartItems } from '../../store/cartItems';


const CartShowPage = () => {
    const dispatch = useDispatch();
    const cart = useSelector(getCart());
    const allItems = useSelector(getCartItems);
    
    useEffect(() => {
        dispatch(fetchCart())
        dispatch(fetchCartItems)
    }, [dispatch])

    if (!cart) return <h1>Loading...</h1>

    const filteringItems = (items, cartId) => {
        Object.freeze(items);
        return items.filter(item => item.cartId === cartId)
    }

    const filteredCartItems = filteringItems(allItems, cart.id)

    const emptyCart = <h2 className='empty-cart'>Your Ameizin' Cart is empty</h2>

    const itemList = filteredCartItems.map(item => {
        return <div key={item.id}>
                    <CartProductContainer id={`cart-item-box-${item.id}`} cartItem={item}/>
                </div>
    });

    

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
                    {(filteredCartItems.length === 0) ? emptyCart : itemList}
                    </div>
                    <div id='checkout-section'>
                        <button>Checkout</button>
                    </div>
                </div>
            </div>

        </div>
    )

};

export default CartShowPage;