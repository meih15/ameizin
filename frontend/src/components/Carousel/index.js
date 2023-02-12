import React from "react";
import { Swiper, SwiperSlide } from "swiper/react";
import { Navigation, A11y, Scrollbar } from "swiper";
import "swiper/css";
import "swiper/css/navigation";
import 'swiper/css/scrollbar'
import ProductContainer from "../ProductContainer";
import './Carousel.css';

const Carousel = ({products}) => {   
    
    const productsList = [...products] || [];

    return (
       <>
        <Swiper
            className="carousel-container"
            modules={[Navigation, A11y, Scrollbar]}
            slidesPerView={4}
            spaceBetween={0}
            style={{ width: 'auto', height: '100%', background: '#f7f7f7' }}
            navigation
            scrollbar={{draggable: true}}
        >
            {productsList.map((product, i) => {
                return(
                    <SwiperSlide className='product-box' key={product.id}>
                        <ProductContainer key={i} productId={product.id}/>
                    </SwiperSlide>
                )
            })}
            
        </Swiper>
        </> 
    )
}

export default Carousel;