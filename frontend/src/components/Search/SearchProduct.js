import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import switch2Pic from '../../image/oled-switch.jpeg';
import { fetchReviews, getReviews } from '../../store/reviews';
import ProductRating from './ProductRating';
import './SearchProduct.css'

const SearchProduct = ({product}) => {
    const dispatch = useDispatch();
    const reviews = useSelector(getReviews);

    useEffect(() => {
        dispatch(fetchReviews())
    }, [dispatch])

    const filteringReviews = (reviews, productId) => {
        Object.freeze(reviews);
        return reviews.filter(review => review.productId === parseInt(productId))
    };

    const filteredReviews = filteringReviews(reviews, product.id);
    if (!reviews) return null;

    return (
        <div className="search-result-product-container">
            <img id='searchResultReviewImage' src={switch2Pic} alt='filler-pic'/>
            <div>
                <p>{product.productName}</p>
                <div>
                    <ProductRating filteredReviews={filteredReviews} />
                </div>
            </div>
        </div>
    )
};

export default SearchProduct;