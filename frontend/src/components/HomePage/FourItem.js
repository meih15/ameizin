import ProductContainer from "../ProductContainer";
import './FourItem.css'

const FourItem = ({products}) => {
    if (!products) return null;

    const fourGrid = products.map(product => {
            return <div id='four-item' key={product.id}>
                        <ProductContainer key={product.id} product={product}/>
                    </div>
    })

    return (
        <div id="four-item-grid">
            {fourGrid}
        </div>
    )
};

export default FourItem;