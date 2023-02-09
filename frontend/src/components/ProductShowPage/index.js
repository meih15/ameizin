import { useEffect } from 'react';
import { useDispatch, useSelector } from "react-redux";
import { useParams } from 'react-router-dom';
import { getProduct, fetchProduct } from '../../store/products';
import './ProductShowPage.css';
import Header from '../Header';
// import switchPic from '../../image/oled-model.avif';
import switch2Pic from '../../image/oled-switch.jpeg';


function ProductShowPage() {
    const dispatch = useDispatch();
    const { productId } = useParams();
    const product = useSelector(getProduct(productId));

    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [dispatch, productId]);

    if (!product) return <h1>Loading..</h1>




    return (
        <>
       
        <Header />
        <div className='pageElements'>
            <div className='top-of-page'>
                <div id="productImage">
                    <img id='fillerImage' src={switch2Pic} alt='filler-pic'/>
                </div>
                <div id='product-info-section'>
                    <div id='product-title'>{product.productName}</div>
                    <div className='break'></div>
                    <div id="product-price">
                        <p id='price-text-info'>Price:</p>
                        <p id='price-symbol-info'>$</p>
                        <p id='price-whole-number-info'>{Math.floor(product.price)}.</p>
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
                        <p id='price-whole-number'>{Math.floor(product.price)}</p>
                        <p id='price-cents'>{Math.floor((product.price % 1) * 100) === 0 ? '00' : Math.floor((product.price % 1) * 100)}</p>
                    </div>
                    <div className='delivery-section'>

                    </div>
                    <div className='stock-left-section'>In Stock</div>
                    <div className='dropdown-quantity'>dropdown</div>
                    <button id="add-to-cart">Add to Cart</button>
                    <div className='secure-transaction'>
                        <i id='lockIcon' className="fa-solid fa-lock"></i>
                        <p id='secure-text'>Secure transaction</p>
                    </div>
                </div>
            </div>
            <div className='middle-of-page'>
                <div id="product-description">{product.description}</div> 
            </div>
            <div className='bottom-of-page'>
                <div id='customer-reviews'></div>
                {/* add this when review component is made */}
            </div>
        </div>
        </>
    )
}


export default ProductShowPage;