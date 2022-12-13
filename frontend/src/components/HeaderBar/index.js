import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import SingleProductCircleTile from "../SingleProductCircleTile";
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

  //Create logic to randomize the circles under the header message
  const productCircleTiles = _.sample(products, 5).map((product) => (
    <SingleProductCircleTile
      key={product.id}
      product={product}
    ></SingleProductCircleTile>
  ));

  useEffect(() => {
    dispatch(fetchProducts());
  }, [dispatch]);

  return (
    <div className="header-bar-wrapper">
      <h1>{headerMessage}</h1>
      <ul className="product-circle-tiles">{productCircleTiles}</ul>
    </div>
  );
}
