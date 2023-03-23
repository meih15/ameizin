import './ProductContainer.css';
import { Link } from 'react-router-dom';


const ProductContainer = ( {product} ) => {

    if (!product) return null;

    return (
        <>
            <div className='product-container'>
                <Link to={`/products/${product.id}`}>
                    <div id='home-page-photos-container'>
                        <img id='home-page-photos' src={product.photourl} alt='homepg-products'></img>
                    </div>
                </Link>
                <Link id='name-product-box' to={`/products/${product.id}`}>
                    <div id='home-page-photos-container-text'>
                        <h1 id='container-product-name'>{product.productName}</h1>
                    </div>
                </Link>
            </div>
        </>

    )
}

export default ProductContainer;