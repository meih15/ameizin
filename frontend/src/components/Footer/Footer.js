import './Footer.css';
import React from 'react';
import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import meiWhiteLogo from '../../image/meiLogo_white.png';

const Footer = () => {

    const handleBackToTop = () => {
        window.scrollTo(0, 0);
    };

    return (
        <div className='whole-footer'>
            <button onClick={handleBackToTop} id='back-to-top'>Back to top</button>
            <div id='footer-section'>
                <a id='github' href='https://github.com/meih15/ameizin' target='_blank' rel="noreferrer"><i id='footer-github' className="fa-brands fa-square-github"/></a>
                <a id='linkedin' href='https://www.linkedin.com/in/mei-huang-ba967a159' target='_blank' rel="noreferrer"><i id='footer-linkedin' className="fa-brands fa-linkedin"/></a>
                <i id='footer-website' className="fa-solid fa-user-tie"/>
            </div>
            <div id='footer-line'></div>
            <div className='footer-logo'>
                <Link className='footLogo' to='/'>
                    <img id='footer-Logo'
                        src={meiWhiteLogo}
                        alt="ameizin_logo"/>
                </Link>
            </div>
            <div id='bot-footer-line'></div>
            <div className='bottom-footer'>
                <i id='copyright' className="fa-regular fa-copyright"/>
                <p id='copyright-text'>2022-2023, Ameizin', Inc. or its affiliates</p>
            </div>
        </div>
    );

};

export default Footer;