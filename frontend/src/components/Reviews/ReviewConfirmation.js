import { Link, useLocation } from "react-router-dom/cjs/react-router-dom.min";
import CategoryNavBar from "../CategoryNavBar";
import Footer from "../Footer/Footer";
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
            <div id="review-submit-break" />
            <div id='done-reviewing-section'>
                <p className='done-review'>Done Reviewing?</p>
                <p className='check-it-review'>Check out these Ameizin' links:</p>
                <div className='done-links-review'>
                    <p id='portfolio-link-review'>Portfolio</p>
                    <a id='github-link-review' href='https://github.com/meih15/ameizin' target='_blank' rel="noreferrer">Github</a>
                    <a id='linkedin-link-review' href='https://www.linkedin.com/in/mei-huang-ba967a159'target='_blank' rel="noreferrer">Linkedin</a>
                    <div className='description-link-review'>
                        <a id='js-link-review' href='https://meih15.github.io/bobabreak/' target='_blank' rel="noreferrer">bobabreak</a>
                        <p id='des-review'>Javascript Project</p>
                    </div>
                    <div className='description-link-review'>
                        <a id='m-link-review' href='https://puppy-play-dates.herokuapp.com/' target='_blank' rel="noreferrer">Puppy Play Dates</a>
                        <p id='des-review'>MERN Stack Project</p>
                    </div>
                </div>
            <div id="review-submit-break" />
            </div>
            <Footer/>
        </div>
    )
};

export default ReviewConfirmation;