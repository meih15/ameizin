import { Link, useLocation } from "react-router-dom/cjs/react-router-dom.min";
import CategoryNavBar from "../CategoryNavBar";
import Header from "../Header";
import './ReviewConfirmation.css';

const ReviewConfirmation = () => {
    const location = useLocation();
    const productId = new URLSearchParams(location.search).get('productId');


    return (
        <div>
            <Header/>
            <CategoryNavBar/>
            <div className="middle-confirmation-review">
                <div className="checkmark-submitted">
                    <i id='check-review' className="fa-solid fa-circle-check"></i>
                    <div id="review-submit-word">
                        <h1 className="review-submitted-thank">Review submitted - Thank you!</h1>
                        <h2 className="processed-review">Review is processed! Checkout the <Link id='link-product-confirmation' to={`/products/${productId}`}>product page</Link> to see your submitted review.</h2>
                    </div>
                </div>
            </div>
        </div>
    )
};

export default ReviewConfirmation;