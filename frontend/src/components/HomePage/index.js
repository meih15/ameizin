import './HomePage.css';
import Header from '../Header';
import ImageSlider from '../ImageSlider';
import kindleBackground from '../../image/background1.jpg';
import electronicsBackground from '../../image/background2.jpg';
import Carousel from '../Carousel';
import { useDispatch, useSelector } from 'react-redux';
import {fetchProducts, getProducts} from '../../store/products';
import { useEffect } from 'react';
import CategoryNavBar from '../CategoryNavBar';
import FourItem from './FourItem';
import IndividualProduct from './IndividualProduct';
import { fetchCategories, getCategories } from '../../store/category';
import Footer from '../Footer/Footer';

function HomePage() {
    const homePageImages = [
        kindleBackground,
        electronicsBackground
    ];

    const homePageImageLinks = [
        '/products/3',
        '/products/4'
    ]
    
    const dispatch = useDispatch();
    const categoriesList = useSelector(getCategories);
    const categories = [...categoriesList] || [];

    const productsList = useSelector(getProducts);
    const products = [...productsList] || [];

    // shuffling products and displaying random ones on homepage
    const shuffledProducts = products.sort(() => Math.random() - 0.5).slice(0, 24);
    const firstFour = shuffledProducts.slice(0, 4);
    const secondFour = shuffledProducts.slice(4, 8);
    const thirdFour = shuffledProducts.slice(8, 12);
    const lastFour = shuffledProducts.slice(12, 16);
    const fourBoxProducts = shuffledProducts.slice(16, 20);

    const secondSetFirstFour = shuffledProducts.slice(20, 24);

    // shuffling categories, and displaying products from random categories on homepage
    const shuffledCategories =  categories.sort(() => Math.random() - 0.5);

    const filtering = (products, cId) => {
        Object.freeze(products);
        return products.filter(product => product.categoryId === parseInt(cId));
    };

    const firstCategory = filtering(products, shuffledCategories[0]?.id);
    const firstCategoryProducts = firstCategory.slice(0, 10);

    const secondCategory = filtering(products, shuffledCategories[1]?.id);
    const secondCategoryProducts = secondCategory.slice(0, 10);

    const thirdCategory = filtering(products, shuffledCategories[2]?.id);
    const thirdCategoryProducts = thirdCategory.slice(0, 4);

    const fourthCategory = filtering(products, shuffledCategories[3]?.id);
    const fourthCategoryProducts = fourthCategory.slice(0, 4);

    const fifthCategory = filtering(products, shuffledCategories[4]?.id);
    const fifthCategoryProducts = fifthCategory.slice(0, 4);

    const sixthCategory = filtering(products, shuffledCategories[5]?.id);
    const sixthCategoryProducts = sixthCategory.slice(0, 10);

    useEffect(() => {
        dispatch(fetchProducts())
        dispatch(fetchCategories())
    }, [dispatch]);

    if (!productsList) return null;
    if (!categoriesList) return null;

    return (
        <>
            <div className='whole-home-page'>
                <div className='header-home'>
                    <Header />
                    <CategoryNavBar />
                </div>
                <main id='main-page'>
                    <div className='splash-page'>
                        <ImageSlider images={homePageImages} imageLinks={homePageImageLinks} />
                        <div className='product-show-home'>
                            <div className='first-four-grid'>
                                <div id='first-container'>
                                    <p id='title-grid'>Items to consider</p>
                                    <FourItem id='grid-products' products={firstFour} />
                                </div>
                                <div id='first-container'>
                                    <p id='title-grid'>Keep shopping for</p>
                                    <FourItem id='grid-products' products={secondFour} />
                                </div>
                                <div id='first-container'>
                                    <p id='title-grid'>For You</p>
                                    <FourItem id='grid-products' products={thirdFour} />
                                </div>
                                <div id='first-container'>
                                    <p id='title-grid'>More {shuffledCategories[2]?.categoryName}</p>
                                    <FourItem id='grid-products' products={thirdCategoryProducts} />
                                </div>
                            </div>
                            <div className='second-four-grid'>
                                <div id='second-container'>
                                    <p id='two-title-grid'>Top Pick</p>
                                    <IndividualProduct product={fourBoxProducts[0]} />
                                </div>
                                <div id='second-container'>
                                    <p id='two-title-grid'>Buy Now</p>
                                    <IndividualProduct product={fourBoxProducts[1]} />
                                </div>
                                <div id='second-container'>
                                    <p id='two-title-grid'>New Item</p>
                                    <IndividualProduct product={fourBoxProducts[2]} />
                                </div>
                                <div id='second-container'>
                                    <p id='two-title-grid'>Great Deal</p>
                                    <IndividualProduct product={fourBoxProducts[3]} />
                                </div>
                            </div>
                            <div className='carouselOne'>
                                <p id='category-title'>{shuffledCategories[0]?.categoryName} you may like</p>
                                <Carousel products={firstCategoryProducts}/>
                            </div>
                            <div className='carouselOne'>
                                <p id='category-title'>Consider these items from {shuffledCategories[1]?.categoryName}</p>
                                <Carousel products={secondCategoryProducts}/>
                            </div>
                            <div className='first-four-grid-two'>
                                <div id='first-container'>
                                    <p id='title-grid'>Check these out</p>
                                    <FourItem id='grid-products' products={secondSetFirstFour} /> 
                                </div>
                                <div id='first-container'>
                                    <p id='title-grid'>{shuffledCategories[3]?.categoryName}</p>
                                    <FourItem id='grid-products' products={fourthCategoryProducts} />
                                </div>
                                <div id='first-container'>
                                    <p id='title-grid'>Recommendations</p>
                                    <FourItem id='grid-products' products={lastFour} />
                                </div>
                                <div id='first-container'>
                                    <p id='title-grid'>Popular Products</p>
                                    <FourItem id='grid-products' products={fifthCategoryProducts} />
                                </div>
                            </div>
                            <div className='carouselOne'>
                                <p id='category-title'>More items to consider from {shuffledCategories[5]?.categoryName}</p>
                                <Carousel products={sixthCategoryProducts}/>
                            </div>
                        </div>
                    </div>
                </main>
                <div id='bottom'>
                    <Footer/>
                </div>
            </div>
        </>
    )
}

export default HomePage;
