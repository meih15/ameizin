import './SearchShowPage.css'
import React, { useState, useEffect } from 'react';
import { useLocation } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { fetchProducts, getProducts } from '../../store/products';
import Header from '../Header';
import CategoryNavBar from '../CategoryNavBar'
import SearchProduct from './SearchProduct';

const SearchShowPage = () => {
    const location = useLocation();
    const dispatch = useDispatch();
    const [searchQuery, setSearchQuery]  = useState('');
    const products = useSelector(getProducts);

    useEffect(() => {
        const searchParams = new URLSearchParams(location.search);
        const query = searchParams.get('searchQuery');
        setSearchQuery(query || '');
    },[location.search]);

    useEffect(() => {
        dispatch(fetchProducts())
    }, [dispatch]);

    const filteringItems = (items, search) => {
        Object.freeze(items);
        return items.filter(item => item.productName.toLowerCase().includes(search.toLowerCase()));
    }

    const searchResults = filteringItems(products, searchQuery);
    const totalResults = searchResults.length

    const searchProducts = searchResults.map(product => {
        return <div key={product.id}>
                    <SearchProduct id={`result-box-${product.id}`} product={product}/>
                </div>
    });


    if (!products) return null;

    return (
        <div>
            <Header/>
            <CategoryNavBar/>
            {totalResults > 1 ? <div id='number-result-container'>{totalResults} results for <p id='searchword'>"{searchQuery}"</p></div> : <div id='number-result-container'>{totalResults} result for <p id='searchword'>"{searchQuery}"</p></div>}
            <div className='search-results-section'>
                <h1 id='search-result-text'>RESULTS</h1>
                {searchProducts}
            </div>
        </div>
    )
};

export default SearchShowPage;