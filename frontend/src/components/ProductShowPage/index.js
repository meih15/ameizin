import './ProductShowPage.css';
import { useEffect } from 'react';
import { useDispatch, useSelector } from "react-redux";
import { Link, useParams } from 'react-router-dom';
import { getProduct, fetchProduct } from '../store/reports';
import Header from '../Header';

function ProductShowPage() {
    const dispatch = useDispatch();
    const { productId } = useParams();
    const product = useSelector(getProduct(productId));

    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [dispatch, productId]);

    return (
        <>
        <Header />
        <div className='top-of-page'>
            <div id="product-image"></div>
            <div id='product-info-section'></div>
            <div id="add-to-cart"></div>
        </div>
        <div className='middle-of-page'>
           <div id="product-description"></div> 
        </div>
        <div className='bottom-of-page'>
            <div id='customer-reviews'></div>
        </div>
        </>
    )
}


export default ProductShowPage;