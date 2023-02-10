import './ProductContainer.css';
import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchProduct, getProduct } from '../../store/product';
import { Link } from 'react-router-dom';


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
                    <img id='' src='' alt=''></img>
                </Link>
                <Link to={`/products/${productId}`}>
                    <h1 id='container-product-name'>{product.productName}</h1>
                </Link>
            </div>
        </>

    )
}

export default ProductContainer;