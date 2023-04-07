import './Footer.css';
import React from 'react';
import { useHistory } from 'react-router-dom/cjs/react-router-dom.min';
import meiWhiteLogo from '../../image/meiLogo_white.png';

const Footer = () => {
    const history = useHistory();


    const handleBackToTop = (e) => {
        e.preventDefault();
        window.scrollTo(0, 0);
    };

    const handleBackhome = (e) => {
        e.preventDefault();
        history.push('/');
        window.location.reload();
    }

    return (
        <div className='whole-footer'>
            <button onClick={handleBackToTop} id='back-to-top'>Back to top</button>
            <div id='footer-section'>
                <a id='github' href='https://github.com/meih15/ameizin' target='_blank' rel="noreferrer"><i id='footer-github' className="fa-brands fa-square-github"/></a>
                <a id='linkedin' href='https://www.linkedin.com/in/mei-huang-ba967a159' target='_blank' rel="noreferrer"><i id='footer-linkedin' className="fa-brands fa-linkedin"/></a>
                <a id='portfolio' href='https://meihuang.me' target='_blank' rel="noreferrer"><i id='footer-website' className="fa-solid fa-user-tie"/></a>
            </div>
            <div id='footer-line'></div>
            <div className='footer-logo'>
                <button className='footLogo' onClick={handleBackhome}>
                    <img id='footer-Logo'
                        src={meiWhiteLogo}
                        alt="ameizin_logo"/>
                </button>
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