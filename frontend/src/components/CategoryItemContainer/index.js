import './CategoryItemContainer.css'
import { Link } from "react-router-dom";
import switch2Pic from '../../image/oled-switch.jpeg';
import ProductRating from '../Search/ProductRating';
import { useDispatch, useSelector } from 'react-redux';
import { fetchReviews, getReviews } from '../../store/reviews';
import { useEffect } from 'react';


const CategoryItemContainer = ({product}) => {
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

    return (
            <div className='category-product-container'>
                <Link to={`/products/${product.id}`}>
                    <img id='image-box' src={product.photourl} alt='product'></img>
                </Link>
                <div id='cat-product-info'>
                    <Link id='category-product-name' to={`/products/${product.id}`}>
                        <h1 id='category-product-name'>{product.productName}</h1>
                    </Link>
                    <ProductRating filteredReviews={filteredReviews}/>
                    <div className='cat-price'>
                            <p id='cat-price-symbol'>$</p>
                            <p id='cat-price-whole-number'>{(Math.floor(product.price)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</p>
                            <p id='cat-price-cents'>{Math.floor((product.price % 1) * 100) === 0 ? '00' : Math.floor((product.price % 1) * 100)}</p>
                    </div>
                </div>
            </div>
    )
}

export default CategoryItemContainer;
