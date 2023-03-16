import { Link } from "react-router-dom/cjs/react-router-dom.min";
import switch2Pic from '../../image/oled-switch.jpeg';
import './IndividualProduct.css'

const IndividualProduct = ({product}) => {
    if (!product) return null;

    return (
        <div className="product-individual">
            <Link to={`/products/${product.id}`}>
                <div id=''>
                    <img id='individual-image' src={switch2Pic} alt='homepg-products'></img>
                </div>
            </Link>
            <Link id='no-decoration' to={`/products/${product.id}`}>
                <div id='single-container'>
                    <h1 id='individual-product-name'>{product.productName}</h1>
                </div>
            </Link>
        </div>
    )
};

export default IndividualProduct;