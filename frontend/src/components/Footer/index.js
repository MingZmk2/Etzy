import React from "react";
// import { Link } from "react-router-dom";
import "./index.css";

const Footer = () => {
  return (
    <div className="footer-outer-container">
      <div className="footer-inner-container">
        <div className="footer-col">
          <h1>Projects</h1>
          <ul className="footer-list-container">
            <li>
              <a
                href="https://mingzmk2.github.io/Operation-Helix/"
                target="_blank"
                rel="noreferrer"
              >
                Operation Helix
              </a>
            </li>
            <li>
              <a
                href="https://rebindr.onrender.com/"
                target="_blank"
                rel="noreferrer"
              >
                reBindr
              </a>
            </li>

            {/* <a href="https://www.heyitsming.com/" target="_blank">
            My Portfolio
          </a> */}
          </ul>
        </div>
        <div className="footer-col">
          <h1>Language</h1>
          <div className="footer-list-container">
            <p>JavaScript - Frontend</p>
            <p>Ruby - Backend</p>
          </div>
        </div>
        <div className="footer-col">
          <h1>Technology</h1>
          <div className="footer-list-container">
            <p>React & Redux</p>
            <p>HTML5/CSS3</p>
            <p>Ruby on Rails</p>
            <p>AWS S3</p>
            <p>PostgreSQL</p>
          </div>
        </div>
        <div className="footer-col">
          <div className="help-container">
            <h1>Social</h1>
          </div>

          <div className="social-links">
            <a
              href="https://github.com/MingZmk2"
              target="_blank"
              rel="noreferrer"
            >
              <img src="../github.png" alt="Github" />
            </a>
            <a
              href="https://www.linkedin.com/in/mingzhang8/"
              target="_blank"
              rel="noreferrer"
            >
              <img src="../linkedin.png" alt="LinkedIn" />
            </a>
            <a
              href="https://angel.co/u/ming-zhang-18"
              target="_blank"
              rel="noreferrer"
            >
              <img src="../angellist.png" alt="AngelList" />
            </a>
          </div>
        </div>
      </div>
    </div>
  );
  // return (
  //   <div className="footer-container">
  //     <div className="footer">
  //       <ul>
  //         <li>&#169; Ming's Etzy</li>
  //         <li>
  //           <a href="https://github.com/MingZmk2">
  //             <img src="../github.png" alt="Github" />
  //           </a>
  //         </li>
  //         <li>
  //           <a href="https://www.linkedin.com/in/mingzhang8/">
  //             <img src="../linkedin.png" alt="LinkedIn" />
  //           </a>
  //         </li>
  //       </ul>
  //     </div>
  //   </div>
  // );
};

export default Footer;
