import './CategoryShowPage.css';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { fetchCategories, fetchCategory, getCategory } from '../../store/category';
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
    const allProducts = products ? [...products] : [];


    useEffect(() => {
        dispatch(fetchCategories())
        dispatch(fetchProducts())
        dispatch(fetchCategory(categoryId))
    }, [dispatch, categoryId]);


    const filtering = (allProducts, cId) => {
        Object.freeze(allProducts);
        return allProducts.filter(product => product.categoryId === cId);
    };

    const filteredList = filtering(allProducts, categoryId);

    return (
        <div className='cat-show-page'>
            <Header />
            <CategoryNavBar />
            <h1 id='category-name'>{category.categoryName}</h1>
            <div id='cat-item-container'>
                {filteredList.map(product => 
                    <div id='cat-item'>
                        <CategoryItemContainer product={product}/>
                    </div>
                    )}
            </div>
        </div>
    );

}

export default CategoryShowPage;
