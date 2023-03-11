import switch2Pic from '../../image/oled-switch.jpeg';
import './SearchProduct.css'

const SearchProduct = ({product}) => {

    return (
        <div className="search-result-product-container">
            <img id='searchResultReviewImage' src={switch2Pic} alt='filler-pic'/>
            <div>

            </div>
        </div>
    )
};

export default SearchProduct;