import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchProducts, getProducts } from "../../store/product";
import HeaderBar from "../HeaderBar";
import SingleProductTile from "../SingleProductTile";
import _ from "underscore";
import "./index.css";

function HomePage() {
  const dispatch = useDispatch();

  const products = useSelector(getProducts);

  //create logic to randomize the 2x5 tiles
  //use underscore.js to randomize the seed products
  //better than Math.random()
  const productListTiles = _.sample(products, 10).map((product) => (
    <SingleProductTile key={product.id} product={product}></SingleProductTile>
  ));
  // console.log(productListTiles);
  console.log(products);
  // debugger;
  useEffect(() => {
    dispatch(fetchProducts());
  }, []);

  return (
    <div className="home-page">
      <div className="header-bar-container">
        <HeaderBar />
      </div>

      <div className="second-section">
        <div className="product-tiles-wrapper">
          <div>
            <h3>Recently viewed & more</h3>
          </div>
          <ul className="product-list-tiles">{productListTiles}</ul>
        </div>
      </div>

      <div className="footer">
        <ul className="right-footer">
          <li>&#169; Ming's Etzy</li>
        </ul>
      </div>
    </div>
  );
}

export default HomePage;
