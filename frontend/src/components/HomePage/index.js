import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchProducts, getProducts } from "../../store/product";
import HeaderBar from "../HeaderBar";
import SingleProductTile from "../SingleProductTile";
// import _ from "underscore";
import "./index.css";
import SingleProductCircleTile from "../SingleProductCircleTile";
import ProductsGridTiles from "./ProductsGridTiles";

function HomePage() {
  const dispatch = useDispatch();

  const products = useSelector(getProducts);
  // debugger;

  // console.log(products);

  const productTilesArr1 = products.slice(6, 16);
  const productCircleTilesArr2 = products.slice(16, 22);

  //don't use sample for now because render problem
  // const productListTiles1 = _.sample(productTilesArr1, 10).map((product) => (
  //   <SingleProductTile key={product.id} product={product}></SingleProductTile>
  // ));

  const productListTiles1 = productTilesArr1.map((product) => (
    <SingleProductTile key={product.id} product={product}></SingleProductTile>
  ));

  // const productListTiles2 = productTilesArr2.map((product) => (
  //   <SingleProductTile key={product.id} product={product}></SingleProductTile>
  // ));

  //Create logic to randomize the circles under the header message
  const productCircleTiles2 = productCircleTilesArr2.map((product) => (
    <SingleProductCircleTile
      key={product.id}
      product={product}
    ></SingleProductCircleTile>
  ));

  // debugger;
  useEffect(() => {
    dispatch(fetchProducts());
  }, [dispatch]);

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
          <ul className="product-list-tiles">{productListTiles1}</ul>
        </div>
      </div>

      <div className="third-section">
        <div className="product-tiles-wrapper">
          <ul className="product-circle-tiles">{productCircleTiles2}</ul>
        </div>
      </div>

      <div className="fourth-section">
        <h3>Here are some more chill stuff</h3>
        <ProductsGridTiles />
      </div>
    </div>
  );
}

export default HomePage;
