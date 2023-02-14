import { useDispatch, useSelector } from 'react-redux';
import { getCart, fetchCart } from '../../store/carts';
import { useEffect} from 'react';
import './CartShowPage.css'


const CartShowPage = () => {
    const dispatch = useDispatch();
    const cart = useSelector(getCart());
    
    useEffect(() => {
        dispatch(fetchCart())
    }, [dispatch])

    if (!cart) return <h1>Loading...</h1>

    return (
        <div>
            
        </div>
    )

};

export default CartShowPage;