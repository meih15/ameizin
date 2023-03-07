import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useLocation } from "react-router-dom/cjs/react-router-dom.min";
import { fetchProduct, getProduct } from "../../store/products";
import Header from '../Header';
import CategoryNavBar from '../CategoryNavBar';
import StarRating from "./StarRating";
import switch2Pic from '../../image/oled-switch.jpeg';


const CreateReview = () => {
    const dispatch = useDispatch();
    const location = useLocation();
    const productId = new URLSearchParams(location.search).get('productId');
    const product = useSelector(getProduct(productId));
    const currrentUser = useSelector(state => state.session.user);


    useEffect(() => {
        dispatch(fetchProduct(productId))
    }, [dispatch, productId]);


    return (
        <div>
            <div className="top-review-form">
                <Header />
                <CategoryNavBar/>
            </div>
            
            <div className="middle-of-review-form">
                <h1>Create Reviews</h1>
                <div className="review-form-product-info">
                    <img id='fillerReviewImage' src={switch2Pic} alt='filler-pic'/>
                    <h2>{product.productName}</h2>
                </div>
                <h3>Overall Rating</h3>
                <StarRating/>
                <h4>Add a headline</h4>
                {/* input field for headline */}
                {/* photo section */}
                <h5>Add a written review</h5>
                {/* input field for review */}
                <button>Submit</button>
            </div>
        </div>
    )
};

export default CreateReview;