import React from "react";
import { Link } from "react-router-dom";
import "./index.css";

//create a single product function that renders one product image and price in some form of tile

const SingleProductCircleTile = ({ product }) => {
  return (
    <li className="product">
      <Link className="product-img" to={`/products/${product.id}`}>
        <img src={product.photoUrl} alt="" />
      </Link>
      <span className="product-name">{product.productName}</span>
    </li>
  );
};

export default SingleProductCircleTile;
