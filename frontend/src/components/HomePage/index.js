import './HomePage.css';
import Header from '../Header';
import ImageSlider from '../ImageSlider';
import kindleBackground from '../../image/background1.jpg';
import electronicsBackground from '../../image/background2.jpg';
// import BackgroundCarousel from '../HomeBackgroundCarousel';

function HomePage() {
    const homePageImages = [
        kindleBackground,
        electronicsBackground
    ];

    const homePageImageLinks = [
        '/products/3',
        '/products/4'
    ]

    return (
        <>
            <div className='whole-home-page'>
                <div className='header-home'>
                <Header />
                </div>
                <div className='splash-page'>
                    <ImageSlider images={homePageImages} imageLinks={homePageImageLinks} />
                </div>
            </div>
        </>
    )
}

export default HomePage;
