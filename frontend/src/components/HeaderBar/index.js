import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import SingleProductTile from "../SingleProductTile";
import _ from "underscore";
import "./index.css";
import { fetchProducts, getProducts } from "../../store/product";

//component to show message and circle tiles under the top nav component

export default function HeaderBar() {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.user?.current);

  let headerMessage = "Find your inner peace with a couple of goods.";

  if (sessionUser) {
    headerMessage = `Welcome back, ${sessionUser.firstName}!`;
  }

  const products = useSelector(getProducts);

  //Create logic to randomize the circles under theheader message
  const productCircleTiles = _.sample(products, 5).map((product) => (
    <SingleProductTile key={product.id} product={product}></SingleProductTile>
  ));

  useEffect(() => {
    dispatch(fetchProducts());
  }, []);

  return (
    <div className="header-bar-wrapper">
      <br />
      <h1>{headerMessage}</h1>
      <ul className="product-circle-tiles">{productCircleTiles}</ul>
    </div>
  );
}
