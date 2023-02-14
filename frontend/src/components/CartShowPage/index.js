import { useDispatch, useSelector } from 'react-redux';
import { getCart, fetchCart } from '../../store/carts';
import { useEffect} from 'react';
import Header from '../Header';
import './CartShowPage.css'
import CategoryNavBar from '../CategoryNavBar';
import CartProductContainer from '../CartProductContainer';


const CartShowPage = () => {
    const dispatch = useDispatch();
    const cart = useSelector(getCart());
    
    useEffect(() => {
        dispatch(fetchCart())
    }, [dispatch])

    if (!cart) return <h1>Loading...</h1>

    // const emptyCart = <h2 className='empty-cart'>Your Ameizin' Cart is empty</h2>

    // const itemList = cart.cartItems.map(item => {
    //     return <div>
    //         <CartProductContainer key={item.id} id={`cart-item-box-${item.id}`} cartItem={item}/>
    //         </div>
    // });

    return (
        <div className='entire-cart-page'>
            <div id='top-of-cart-page'>
                <Header />
                <CategoryNavBar />
            </div>
            {/* <div id='middle-cart-page'>
                <div id='cart-items-section'>
                    <h1 className='shopping-cart-text'>Shopping Cart</h1>
                   {(cart.cartItems.length === 0) ? emptyCart : itemList}
                </div>
                <div id='checkout-section'>

                </div>
            </div> */}

        </div>
    )

};

export default CartShowPage;