import './CartProductContainer.css';
import switch2Pic from '../../image/oled-switch.jpeg';


const CartProductContainer = ({cartItem}) => {

    return(
            <div id='cart-left-side'>
                <div className='cart-product-box'>
                    <img src={switch2Pic} id='cart-product-image' alt='cart-product'/>
                    <div id='cart-product-middle-section'>
                        
                    </div>
                    <p id='cart-item-price-amount'></p>
                </div>
            </div>
               
    )
};

export default CartProductContainer;