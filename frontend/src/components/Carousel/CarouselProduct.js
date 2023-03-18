import switch2Pic from '../../image/oled-switch.jpeg';
import './CarouselProduct.css'

const CarouselProduct = ({product}) => {

    return (
        <div>
            {/* {product.photourl} */}
            <img id='individual-carousel-image' src={switch2Pic} alt='homepg-products'></img>
        </div>
    )
};

export default CarouselProduct;