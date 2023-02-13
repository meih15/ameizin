import './CategoryNavBar.css';
import { useDispatch, useSelector } from 'react-redux';
import { useEffect} from 'react';
import { getCategories, fetchCategories } from '../../store/category';
import { Link } from 'react-router-dom';

const CategoryNavBar = () => {

    const dispatch = useDispatch();
    const categoriesList = useSelector(getCategories);

    const categories = [...categoriesList]

    useEffect(() => {
        dispatch(fetchCategories())
    }, [dispatch]);

    return (
        <div className='catnavbar'>
            {
                categories.map(category => 
                    <Link key={category.id} id='cat' to={`/categories/${category.id}`}>
                        <p>{category.categoryName}</p>
                    </Link>)
            }
        </div>
    );
};

export default CategoryNavBar;
