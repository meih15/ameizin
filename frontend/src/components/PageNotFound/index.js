import './PageNotFound.css'
import Header from '../Header';
import { Link } from 'react-router-dom';


const PageNotFound = () => {

    return (
        <>
        <div className='page404'>
        <Header />
        <div id='error_message'>
            <h1 className='sorry'>SORRY</h1>
            <h2>we couldn't find that page</h2>
            <div>
                <h3>Try searching or go to <Link id='404_home_link' to='/'>Amazon's home page</Link></h3>
            </div>
        </div>
        </div>
        </>
    )
}

export default PageNotFound;