import React from "react";
import { Swiper, SwiperSlide } from "swiper/react";
import { Navigation, A11y, Scrollbar } from "swiper";
import "swiper/css";
import "swiper/css/navigation";
import 'swiper/css/scrollbar'
import './Carousel.css';
import CarouselProduct from "./CarouselProduct";
import { CarouselNextButton, CarouselPrevButton } from "./Buttons";

const Carousel = ({products, name}) => {   
    
    const productsList = [...products] || [];

    const carouselClassName = `carousel-container-${name}`;

    return (
       <div className="adjust-carousel-width">
            <Swiper
                className={`carousel-container ${carouselClassName}`}
                modules={[Navigation, A11y, Scrollbar]}
                slidesPerView={window.innerWidth < 1400 ? 4 : 6}
                spaceBetween={0}
                style={{ width: "auto", height: '100%', background: 'white' }}
                navigation={{
                        nextEl: `.${name}-custom-next-button`,
                        prevEl: `.${name}-custom-prev-button`,
                    }}
                scrollbar={{draggable: true}}
            >
                {productsList.map((product, i) => {
                    return(
                        <SwiperSlide className='product-box' key={product.id}>
                            <CarouselProduct key={i} product={product}/>
                        </SwiperSlide>
                    )
                })}
                
            </Swiper>
            <div className="custom-nav-buttons">
				<CarouselPrevButton name={name} className={carouselClassName}/>
				<CarouselNextButton name={name} className={carouselClassName}/>
			</div>
        </div> 
    )
}

export default Carousel;
