import './CategoryShowPage.css';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchCategory, getCategory } from '../../store/category';
import { fetchProducts, getProducts } from '../../store/products';
import { useEffect } from 'react';
import Header from '../Header';
import CategoryNavBar from '../CategoryNavBar';
import CategoryItemContainer from '../CategoryItemContainer';


const CategoryShowPage = () => {
    const dispatch = useDispatch();
    const {categoryId} = useParams();
    
    const category = useSelector(getCategory(categoryId));
    const products = useSelector(getProducts);


    useEffect(() => {
        // dispatch(fetchCategories())
        dispatch(fetchProducts())
        dispatch(fetchCategory(categoryId))
    }, [dispatch, categoryId]);

    const filtering = (products, cId) => {
        // debugger
        Object.freeze(products);
        return products.filter(product => product.categoryId === parseInt(cId));
    };

    const filteredList = filtering(products, categoryId);
    if (!category) return null;

     const list =  filteredList.map(product => {
        // debugger
          return <div id='cat-item'>
            <CategoryItemContainer product={product}/>
                    </div>
            } )
    
    return (
        <div className='cat-show-page'>

           <Header />
            <CategoryNavBar />
            <h1 id='category-name'>{category.categoryName}</h1>
            <div id='cat-item-container'>
                {/* {filteredList.map(product => 
                    <div id='cat-item'>
                        <CategoryItemContainer product={product}/>
                    </div>
                    )} */}
                    {list}
            </div>
        </div>
    );

}

export default CategoryShowPage;
