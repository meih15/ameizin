import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link } from 'react-router-dom/cjs/react-router-dom.min';
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

    const formattedPrice = (<div className='search-price'>
                                <p id='search-price-symbol'>$</p>
                                <p id='search-price-whole-number'>{(Math.floor(product.price)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</p>
                                <p id='search-price-cents'>{Math.floor((product.price % 1) * 100) === 0 ? '00' : Math.floor((product.price % 1) * 100)}</p>
                            </div>)

    if (!reviews) return null;

    return (
        <div className="search-result-product-container">
            <Link to={`/products/${product.id}`}>
                <img id='searchResultReviewImage' src={product.photourl} alt='filler-pic'/>
            </Link>
            <div id='search-product-info'>
                <Link id='search-product-name' to={`/products/${product.id}`}>
                    <div className='search-product-name-container' style={{ display: 'inline-block' }}>
                    <p id='search-name' style={{ display: '-webkit-box', '-webkit-line-clamp': 2, '-webkit-box-orient': 'vertical', textOverflow: 'ellipsis', whiteSpace: 'normal', overflow: 'hidden', cursor: 'pointer' }}>{product.productName}</p>
                    </div>
                </Link>
                <div id='search-rating-container'>
                    <ProductRating filteredReviews={filteredReviews} />
                </div>
                <Link id='search-product-price'>{formattedPrice}</Link>
            </div>
        </div>
    )
};

export default SearchProduct;