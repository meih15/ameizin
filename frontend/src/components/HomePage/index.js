import './HomePage.css';
import Header from '../Header';
import ImageSlider from '../ImageSlider';
import kindleBackground from '../../image/background1.jpg';
import electronicsBackground from '../../image/background2.jpg';
import Carousel from '../Carousel';
import { useDispatch, useSelector } from 'react-redux';
// import { getCategories, fetchCategories } from '../../store/category';
import {fetchProducts, getProducts} from '../../store/products';
import { useEffect } from 'react';
import ProductContainer from '../ProductContainer';
import CategoryNavBar from '../CategoryNavBar';
import FourItem from './FourItem';
import IndividualProduct from './IndividualProduct';

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
    // const categoriesList = useSelector(getCategories);
    // const categories = [...categoriesList] || [];

    const productsList = useSelector(getProducts);
    const products = [...productsList] || [];
    const shuffledProducts = products.sort(() => Math.random() - 0.5).slice(0, 20);
    const firstFour = shuffledProducts.slice(0, 4);
    const secondFour = shuffledProducts.slice(4, 8);
    const thirdFour = shuffledProducts.slice(8, 12);
    const lastFour = shuffledProducts.slice(12, 16);
    const fourBoxProducts = shuffledProducts.slice(16, 20)

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch])

    if (!productsList) return null;

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
                                    <p id='title-grid'>Popular Products</p>
                                    <FourItem id='grid-products' products={secondFour} />
                                </div>
                                <div id='first-container'>
                                    <p id='title-grid'>For You</p>
                                    <FourItem id='grid-products' products={thirdFour} />
                                </div>
                                <div id='first-container'>
                                    <p id='title-grid'>Recommendations</p>
                                    <FourItem id='grid-products' products={lastFour} />
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
                                {/* <Carousel products={productsList}/> */}
                            </div>
                            <div className='last-four-grid'>
                                {lastFour.map(prdct => <ProductContainer key={prdct.id} productId={prdct.id}/>)}
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </>
    )
}

export default HomePage;
