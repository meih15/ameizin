import './CartProductContainer.css';

const CartProductContainer = ({cartItem}) => {

    return(
        <div className='cart-product-box'>
            <img src='' id='cart-product-image' alt='cart-product'/>
            <div id='cart-product-middle-section'>

            </div>
            <p id='cart-item-price-amount'></p>
        </div>
    )
};

export default CartProductContainer;