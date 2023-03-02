import './ProductContainer.css';
import { useEffect } from 'react';
import { useSelector } from 'react-redux';
import { getProduct } from '../../store/products';
import { Link } from 'react-router-dom';
import switch2Pic from '../../image/oled-switch.jpeg';



const ProductContainer = ( {productId} ) => {
    // const dispatch = useDispatch();
    const product = useSelector(getProduct(productId));

    useEffect(()=>{
        // dispatch(fetchProduct(productId))
    }, []);

    return (
        <>
            <div className='product-container'>
                <Link to={`/products/${productId}`}>
                    <img id='' src={switch2Pic} alt=''></img>
                </Link>
                <Link id='name-product-box' to={`/products/${productId}`}>
                    <h1 id='container-product-name'>{product.productName}</h1>
                </Link>
            </div>
        </>

    )
}

export default ProductContainer;