import React from "react";
import { Link } from "react-router-dom";
import "./index.css";

const Footer = () => {
  return (
    <div className="footer-container">
      <div className="footer">
        <ul className="right-footer">
          <li>&#169; Ming's Etzy</li>
        </ul>
      </div>

      <div className="social-links">
        <a href="https://github.com/MingZmk2" target="_blank">
          <img src="etzy/app/assets/github.png" alt="Github" />
        </a>
        <a href="https://www.linkedin.com/in/mingzhang8/" target="_blank">
          <img src="etzy/app/assets/linkedin.png" alt="LinkedIn" />
        </a>
      </div>
    </div>
  );
};

export default Footer;
