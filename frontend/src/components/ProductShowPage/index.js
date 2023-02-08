import { useEffect } from 'react';
import { useDispatch, useSelector } from "react-redux";
import { useParams } from 'react-router-dom';
import { getProduct, fetchProduct } from '../../store/products';
import './ProductShowPage.css';
import Header from '../Header';
import switchPic from '../../image/oled-switch.jpeg';


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
                    <img id='fillerImage' src={switchPic} alt='filler-pic'/>
                </div>
                <div id='product-info-section'>
                    <div>{product.productName}</div>
                    <div id='bullets'>{product.bullets}</div>
                    <div id="product_price'">{product.price}</div>
                </div>
                <div id='payment-section'>
                    <button id="add-to-cart">Add to Cart</button>
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