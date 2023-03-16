import './ProductContainer.css';
import { useEffect } from 'react';
import { useSelector } from 'react-redux';
import { getProduct } from '../../store/products';
import { Link } from 'react-router-dom';
import switch2Pic from '../../image/oled-switch.jpeg';



const ProductContainer = ( {product} ) => {
    // const dispatch = useDispatch();

    // const product = useSelector(getProduct(productId));


    useEffect(()=>{
        // dispatch(fetchProduct(productId))
    }, []);

    if (!product) return null;

    return (
        <>
            <div className='product-container'>
                <Link to={`/products/${product.id}`}>
                    <div id='home-page-photos-container'>
                        <img id='home-page-photos' src={switch2Pic} alt='homepg-products'></img>
                    </div>
                </Link>
                <Link id='name-product-box' to={`/products/${product.id}`}>
                    <div id='home-page-photos-container'>
                        <h1 id='container-product-name'>{product.productName}</h1>
                    </div>
                </Link>
            </div>
        </>

    )
}

export default ProductContainer;