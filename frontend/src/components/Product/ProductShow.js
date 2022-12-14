import * as React from "react";
import { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { getProduct, fetchProduct } from "../../store/product";
import RemoveCircleOutlineIcon from "@mui/icons-material/RemoveCircleOutline";
import AddCircleOutlineIcon from "@mui/icons-material/AddCircleOutline";

import CartModal from "../CartModal/CartModal";
import LoginForm from "../LoginForm";

import _ from "underscore";
import LocalShippingTwoToneIcon from "@mui/icons-material/LocalShippingTwoTone";
import "./ProductShow.css";

const ProductShow = () => {
  const dispatch = useDispatch();
  const [quantity, setQuantity] = useState(1);
  const { productId } = useParams();
  const product = useSelector(getProduct(productId)); //get product from state
  const currentUser = useSelector((state) => state.session.user);
  const [render, setRender] = useState(false);
  console.log(productId);
  console.log(product);
  useEffect(() => {
    dispatch(fetchProduct(productId));
    setRender(true);
  }, [dispatch, productId]);

  if (product && render) {
    setRender(false);
  }

  // let products;
  // let result;
  // if (category.products) {
  //   result = Object.values(category.products).filter(
  //     (product) => product.id !== parseInt(productId)
  //   );
  //   products = _.sample(result, 2);
  // }
  // let productList;
  // if (result) {
  //   productList = products.map((product) => (
  //     <CategoryItemList key={product.id} product={product}></CategoryItemList>
  //   ));
  // }

  let prop;
  if (product && currentUser) {
    prop = {
      productId: productId,
      quantity: quantity,
      currentUserId: currentUser.id,
      availability: product.availability,
    };
  }

  let dynamicAddToCartButton;
  if (currentUser) {
    dynamicAddToCartButton = <CartModal prop={prop} />;
  } else {
    let message = {
      text: "Add to cart",
      type: "add-to-cart-button",
    };
    dynamicAddToCartButton = <LoginForm message={message} />;
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
      <div>
        <div className="product1">
          <div className="product1-left">
            <div className="product1-img-reviews">
              <img src={product.photoUrl} alt="" />
              {/* <Review /> */}
            </div>
          </div>
          <div className="product1-container">
            <h3 className="store-name">{product.storeName}</h3>
            {/* <div className="store-sales">{product.storeSales} Sales</div> */}
            <div className="product1-name">{product.productName}</div>
            <p className="product1-price">${product.price}</p>
            <p className="product1-quantity-text">Quantity:</p>
            <div className="product1-options">
              <label className="product1-option-title">
                {/* <div className="product-option-button" onClick={decrement}>
                  <button>
                    {" "}
                    <RemoveCircleOutlineIcon sx={{ fontSize: 40 }} />{" "}
                  </button>
                </div> */}
                <input
                  type="text"
                  value={quantity}
                  onChange={(e) => setQuantity(parseInt(e.target.value))}
                />
                {/* <div className="product-option-button" onClick={increment}>
                  <button>
                    {" "}
                    <AddCircleOutlineIcon sx={{ fontSize: 40 }} />{" "}
                  </button>
                </div> */}
              </label>
            </div>
            <div id="product1-stock">Stock: {product.availability}</div>
            {dynamicAddToCartButton}
            <div className="shipping">
              <LocalShippingTwoToneIcon color="primary" sx={{ fontSize: 45 }} />
              <p>Hooray!</p> This item ships free to the US.
            </div>
            <p id="product1-description-title">Description:</p>
            <div className="product1-description">
              <span>{product.description}</span>
            </div>
            <div className="product1-suggest">
              {/* <h2>You may also like...</h2> */}
              {/* <ul className="product-suggest-product">{productList}</ul> */}
            </div>
          </div>
        </div>
      </div>
    );
  }
};

export default ProductShow;
