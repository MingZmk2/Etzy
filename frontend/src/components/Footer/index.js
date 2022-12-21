import React from "react";
// import { Link } from "react-router-dom";
import "./index.css";

const Footer = () => {
  return (
    <div className="footer-container">
      <div className="footer">
        <ul>
          <li>&#169; Ming's Etzy</li>
          <li>
            <a href="https://github.com/MingZmk2">
              <img src="../github.png" alt="Github" />
            </a>
          </li>
          <li>
            <a href="https://www.linkedin.com/in/mingzhang8/">
              <img src="../linkedin.png" alt="LinkedIn" />
            </a>
          </li>
        </ul>
      </div>
    </div>
  );
};

export default Footer;
