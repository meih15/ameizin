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
    const shuffledProducts = products.sort(() => Math.random() - 0.5).slice(0, 8);
    const firstFour = shuffledProducts.slice(0, 4);
    const lastFour = shuffledProducts.slice(-4);

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch])


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
                                {firstFour.map(prdct => <ProductContainer key={prdct.id} productId={prdct.id}/>)}
                            </div>
                            <div className='carouselOne'>
                                <Carousel products={productsList}/>
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
