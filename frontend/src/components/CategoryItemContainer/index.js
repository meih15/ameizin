
import './CategoryItemContainer.css'
import { Link } from "react-router-dom";
import switch2Pic from '../../image/oled-switch.jpeg';


const CategoryItemContainer = ({product}) => {

    return (
            <div className='category-product-container'>
                <Link to={`/products/${product.id}`}>
                    <img id='image-box' src={switch2Pic} alt=''></img>
                </Link>
                <Link id='category-product-name' to={`/products/${product.id}`}>
                    <h1 id='category-product-name'>{product.productName}</h1>
                </Link>
                <div className='cat-price'>
                        <p id='cat-price-symbol'>$</p>
                        <p id='cat-price-whole-number'>{(Math.floor(product.price)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}.</p>
                        <p id='cat-price-cents'>{Math.floor((product.price % 1) * 100) === 0 ? '00' : Math.floor((product.price % 1) * 100)}</p>
                </div>
            </div>
    )
}

export default CategoryItemContainer;
