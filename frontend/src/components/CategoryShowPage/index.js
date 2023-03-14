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
        Object.freeze(products);
        return products.filter(product => product.categoryId === parseInt(cId));
    };

    const filteredList = filtering(products, categoryId);
    if (!category) return null;

    const list =  filteredList.map(product => {
        return <div id='cat-item' key={product.id}>
        <CategoryItemContainer key={product.id} product={product}/>
                </div>
    })

    const totalResults = filteredList.length
    
    return (
        <div className='cat-show-page'>

           <Header placeholder={category.categoryName}/>
            <CategoryNavBar />
            {totalResults > 1 ? <div id='category-number-result-container'>{totalResults} results for <p id='category-name'>"{category.categoryName}"</p></div> : <div id='category-number-result-container'>{totalResults} result for <p id='category-name'>"{category.categoryName}"</p></div>}
            <div id='cat-item-container'>
                {list}
            </div>
        </div>
    );

}

export default CategoryShowPage;
