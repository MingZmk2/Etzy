import * as React from "react";
import { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { getProduct, fetchProduct } from "../../store/product";
import _ from "underscore";

import "./ProductShow.css";

const ProductShow = () => {
  const dispatch = useDispatch();
  const [quantity, setQuantity] = useState(1);
  const { productId } = useParams();
  const product = useSelector(getProduct(productId)); //get product from state
  const sessionUser = useSelector((state) => state.session.user);
  const [render, setRender] = useState(false);

  useEffect(() => {
    dispatch(fetchProduct(productId));
    setRender(true);
  }, [productId]); //state add product

  if (product && render) {
    setRender(false);
  }

  let products;
  
  let result;
  if (category.products) {
    result = Object.values(category.products).filter(
      (product) => product.id !== parseInt(productId)
    );
    products = _.sample(result, 2);
  }

  let prop;
  if (product && sessionUser) {
    prop = {
      productId: productId,
      quantity: quantity,
      sessionUserId: sessionUser.id,
      availability: product.availability,
    };
  }

  const increment = (e) => {
    if (quantity < product.availability) {
      setQuantity(quantity + 1);
    }
  };
  const decrement = (e) => {
    if (quantity > 1) {
      setQuantity(quantity - 1);
    }
  };

  if (product) {
    return (

    );
  }
};

export default ProductShow;
