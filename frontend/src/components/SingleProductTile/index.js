import React from "react";
import { Link } from "react-router-dom";
import "./index.css";

//create a single product function that renders one product image and price in some form of tile

const SingleProductTile = ({ product }) => {
  return (
    <li className="product">
      <Link className="product-img" to={`/products/${product.id}`}>
        <img src={product.photoUrl} alt="" />
        <div className="product-price">${product.price}</div>
      </Link>
    </li>
  );
};

export default SingleProductTile;
