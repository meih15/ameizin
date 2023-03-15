import { useEffect, useState} from 'react';
import { useDispatch, useSelector } from "react-redux";
import { useHistory, useParams } from 'react-router-dom';
import { getProduct, fetchProduct } from '../../store/products';
import './ProductShowPage.css';
import Header from '../Header';
// import switchPic from '../../image/oled-model.avif';
import switch2Pic from '../../image/oled-switch.jpeg';
import { getCart, fetchCart } from '../../store/carts';
import { getCartItems, fetchCartItems, updateCartItem, createCartItem } from '../../store/cartItems';
import CategoryNavBar from '../CategoryNavBar';
import ReviewShowPage from '../Reviews';


function ProductShowPage() {
    const dispatch = useDispatch();
    const { productId } = useParams();
    const product = useSelector(getProduct(productId));
    // const { loading, setLoading} = useState(true);
    const cart = useSelector(getCart());
    const cartItems = useSelector(getCartItems);
    const [selectedQuantity, setSelectedQuantity] = useState(1);
    const history = useHistory();

    useEffect(() => {
        dispatch(fetchProduct(productId))
        dispatch(fetchCart())
        dispatch(fetchCartItems())
    }, [dispatch, productId]);


    if (!product) return <h1>Loading...</h1>


    const handleUpdateCart = e => {
        e.preventDefault();
        const matchingCartItem = cartItems.find(item => item.productId === product.id);
      
        const cart_item = {
            id: matchingCartItem?.id,
            productId: product.id,
            cartId: cart.id,
            quantity: selectedQuantity + (matchingCartItem ? matchingCartItem.quantity : 0),
        };

        if (matchingCartItem) {
            if ((selectedQuantity + matchingCartItem.quantity) > product.inventory) {
                alert("Not enough inventory!");
            } else {
                dispatch(updateCartItem(cart_item));
                history.push("/cart")}
        } else {
            dispatch(createCartItem(cart_item));
            history.push("/cart")
        }   
    };

    const handleQuantityChange = e => {
         setSelectedQuantity(parseInt(e.target.value));
    };

    let dropQuantity = [...Array(Math.min(product.inventory, 30) + 1).keys()].slice(1);
    const dropdown = <select className='dropdown-quantity' value={selectedQuantity} onChange={handleQuantityChange}>
                            {dropQuantity.map(qty => <option key={qty} id='dropdown-number' value={qty}>{`Qty: ${qty}`}</option> )}
                        </select>

    // if (product) debugger 

    return ( 
        <div className='entire-product-page'>
            <div className='product-header'>
                <Header />
                <CategoryNavBar />
            </div>
            <div className='pageElements'>
                <div className='top-of-page'>
                    <div id="productImage">
                        <img id='fillerImage' src={product.photourl} alt='filler-pic'/>
                    </div>
                    <div id='product-info-section'>
                        <div id='product-title'>{product.productName}</div>
                        <div className='break'></div>
                        <div id="product-price">
                            <p id='price-text-info'>Price:</p>
                            <p id='price-symbol-info'>$</p>
                            <p id='price-whole-number-info'>{(Math.floor(product.price)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}.</p>
                            <p id='price-cents-info'>{Math.floor((product.price % 1) * 100) === 0 ? '00' : Math.floor((product.price % 1) * 100)}</p>
                        </div>
                        <div className='break'></div>
                        <div id='about-section'>
                            <p id='about-text'>About this item</p>
                            <ul id='bullets'>{product.bullets.map((bullet, i) => <li key={`${i}-bullet`}>{bullet}</li>)}</ul>
                        </div>
                    </div>
                    <div id='payment-section'>
                        <div className='price'>
                            <p id='price-symbol'>$</p>
                            <p id='price-whole-number'>{(Math.floor(product.price)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</p>
                            <p id='price-cents'>{Math.floor((product.price % 1) * 100) === 0 ? '00' : Math.floor((product.price % 1) * 100)}</p>
                        </div>
                        <div className='delivery-section'>

                        </div>
                        <div id='dynamic-stock'>
                            <p className='stock-low'>{(product.inventory < 21 && product.inventory !== 0) ? `Only ${product.inventory} left in stock - order soon.` : ''}</p>
                            <p className='stock-high'>{(product.inventory >= 21) ? 'In Stock.' : ''}</p>
                            <p className='stock-none'>{product.inventory === 0 ? 'Temporarily out of stock.' : ''}</p>
                        </div>
                        <form>
                            {(product.inventory === 0) ? <p id='hide-drop'>dropdown</p> : dropdown} 
                            {(product.inventory === 0) ? <p id='hide-drop'>dropdown</p> : <button id="add-to-cart" onClick={handleUpdateCart}>Add to Cart</button>}
                        </form>
                        <div className='secure-transaction'>
                            <i id='lockIcon' className="fa-solid fa-lock"></i>
                            <p id='secure-text'>Secure transaction</p>
                        </div>
                        <div className='ships-from'>
                            <p id='ships'>Ships from</p>
                            <p id='company'>Ameizin'</p>
                        </div>
                        <div className='sold-by'>
                            <p id='sold'>Sold by</p>
                            <p id='company'>Ameizin'</p>
                        </div>
                    </div>
                </div>
                <div className='middle-of-page'>
                    <div className='break'></div>
                    <p id='description-title'>Product Description</p>
                    <div id="product-description">{product.description}</div> 
                    <div className='break'></div>
                </div>
                <div className='bottom-of-page'>
                    <ReviewShowPage productId={productId}/>
                </div>
            </div>
        </div>
    )
}


export default ProductShowPage;