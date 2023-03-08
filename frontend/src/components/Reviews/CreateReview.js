import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory, useLocation } from "react-router-dom/cjs/react-router-dom.min";
import { fetchProduct, getProduct } from "../../store/products";
import Header from '../Header';
import CategoryNavBar from '../CategoryNavBar';
import StarRating from "./StarRating";
import switch2Pic from '../../image/oled-switch.jpeg';
import { createReview } from "../../store/reviews";


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
        history.push('/review-confirmation');
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
            <form className="middle-of-review-form">
                <h1>Create Reviews</h1>
                <div className="review-form-product-info">
                    <img id='fillerReviewImage' src={switch2Pic} alt='filler-pic'/>
                    <h2>{product.productName}</h2>
                </div>
                <h3>Overall Rating</h3>
                <StarRating rating={rating} setRating={setRating}/>
                <h4>Add a headline</h4>
                <input type="text" value={headline} onChange={(e) => setHeadline(e.target.value)} />
                {/* photo section */}
                <h5>Add a written review</h5>
                <textarea value={comment} onChange={(e) => setComment(e.target.value)} />
                <button onClick={handleCreateReview}>Submit</button>
            </form>
        </div>
    )
};

export default CreateReview;