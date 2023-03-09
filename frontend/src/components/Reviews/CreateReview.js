import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory, useLocation } from "react-router-dom/cjs/react-router-dom.min";
import { fetchProduct, getProduct } from "../../store/products";
import Header from '../Header';
import CategoryNavBar from '../CategoryNavBar';
import StarRating from "./StarRating";
import switch2Pic from '../../image/oled-switch.jpeg';
import { createReview } from "../../store/reviews";
import './CreateReview.css'

const CreateReview = () => {
    const dispatch = useDispatch();
    const history = useHistory();
    const location = useLocation();
    const productId = new URLSearchParams(location.search).get('productId');
    const product = useSelector(getProduct(productId));
    const currrentUser = useSelector(state => state.session.user);
    const [headline, setHeadline] = useState('');
    const [comment, setComment] = useState('');
    const [rating, setRating] = useState(0);


    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [dispatch, productId]);

    const handleCreateReview = e => {
        e.preventDefault();
        dispatch(createReview({
            userId: currrentUser.id,
            productId: productId,
            headline: headline,
            comment: comment,
            rating: rating
        }));
        history.push(`/review-confirmation?productId=${productId}`);
    }

    if (!product) return null;
    if (!currrentUser) return null;

    return (
        <div>
            <div className="top-review-form">
                <Header />
                <CategoryNavBar/>
            </div>
            {/* have name option */}
            <div className="center-form-pls">
                <form className="middle-of-review-form">
                    <h1 id="create-review">Create Reviews</h1>
                    <div className="review-form-product-info">
                        <img id='fillerReviewImage' src={switch2Pic} alt='filler-pic'/>
                        <h2 id="review-product-name">{product.productName}</h2>
                    </div>
                    <div className='create-review-break'></div>
                    <h3 id="overall-rating">Overall Rating</h3>
                    <div id="stars">
                        <StarRating rating={rating} setRating={setRating}/>
                    </div>
                    <div className='create-review-break'></div>
                    <h4 id="add-headline">Add a headline</h4>
                    <input id='headline-input' type="text" placeholder="What's important to know?" value={headline} onChange={(e) => setHeadline(e.target.value)} />
                    {/* photo section */}
                    <div className='create-review-break'></div>
                    <h5 id="add-written-review">Add a written review</h5>
                    <textarea id='written-input' placeholder='What did you like or dislike? What did you use this product for?' value={comment} onChange={(e) => setComment(e.target.value)} />
                    <div className='create-review-break'></div>
                    <div className="submit-move-right">
                        <button id='create-review-submit' onClick={handleCreateReview}>Submit</button>
                    </div>
                </form>
            </div>
        </div>
    )
};

export default CreateReview;