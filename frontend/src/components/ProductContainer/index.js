import './ProductContainer.css';
import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchProduct, getProduct } from '../../store/products';
import { Link } from 'react-router-dom';
import switch2Pic from '../../image/oled-switch.jpeg';



const ProductContainer = ( {productId} ) => {
    const dispatch = useDispatch();
    const product = useSelector(getProduct(productId));

    useEffect(()=>{
        dispatch(fetchProduct(productId))
    }, [dispatch, productId]);

    return (
        <>
            <div className='product-container'>
                <Link to={`/products/${productId}`}>
                    <img id='' src={switch2Pic} alt=''></img>
                </Link>
                <Link to={`/products/${productId}`}>
                    <h1 id='container-product-name'>{product.productName}</h1>
                </Link>
            </div>
        </>

    )
}

export default ProductContainer;