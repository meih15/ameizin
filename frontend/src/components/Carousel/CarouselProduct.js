import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import switch2Pic from '../../image/oled-switch.jpeg';
import './CarouselProduct.css'

const CarouselProduct = ({product}) => {

    return (
        <div id='image-carousel'>
            <Link id='carousel-link' to={`/products/${product.id}`}>
                <img id='individual-carousel-image' src={product.photourl} alt='homepg-products'></img>
            </Link>
        </div>
    )
};

export default CarouselProduct;