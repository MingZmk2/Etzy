import * as React from "react";
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { getProduct, fetchProduct } from "../../store/product";
import CartModal from "../CartModal/CartModal";
import { FormsModal } from "../FormsModal";
import LocalShippingTwoToneIcon from "@mui/icons-material/LocalShippingTwoTone";
import "./ProductShow.css";
import Review from "../Reviews/Reviews";

const ProductShow = () => {
  const dispatch = useDispatch();
  const [quantity, setQuantity] = useState(1);
  const { productId } = useParams();
  const product = useSelector(getProduct(productId));
  const currentUser = useSelector((state) => state.session.user);
  const [render, setRender] = useState(false);

  useEffect(() => {
    dispatch(fetchProduct(productId));
    setRender(true);
  }, [dispatch, productId]);

  if (product && render) {
    setRender(false);
  }

  // debugger;

  let prop;
  if (product && currentUser) {
    prop = {
      productId: productId,
      quantity: quantity,
      currentUserId: currentUser.id,
      availability: product.availability,
    };
  }

  let addToCartBtn;

  if (currentUser) {
    addToCartBtn = <CartModal prop={prop} />;
  } else {
    let message = {
      text: "Add to cart",
      type: "add-to-cart-button",
    };
    addToCartBtn = <FormsModal message={message} />;
  }

  const handleQuantitySelect = (e) => {
    e.preventDefault();
    setQuantity(parseInt(e.target.value));
  };

  //create array to use for dropdown for product availability
  // debugger;
  let availabilityArr = [];
  if (!product) {
    return null;
  }

  for (let i = 1; i <= product.availability; i++) {
    availabilityArr.push(i);
  }

  return (
    <div>
      <div className="product1">
        <div className="product1-left">
          <div className="product1-img-reviews">
            <img src={product.photoUrl} alt="" />
            <Review />
          </div>
        </div>
        <div className="product1-container">
          <div className="product1-name">{product.productName}</div>
          <p className="product1-price">${product.price}</p>
          {/* <p className="product1-quantity-text">Quantity:</p> */}
          <div className="product1-dropdown-container">
            <label htmlFor="qty">Quantity</label>
            <br />
            <br />
            <select
              name="quantity"
              id="quantity"
              className="show-dropdown"
              onChange={handleQuantitySelect}
            >
              {availabilityArr.map((choice, i) => {
                return (
                  <option value={choice} key={i}>
                    {choice}
                  </option>
                );
              })}
            </select>
          </div>
          <div id="product1-stock">Stock: {product.availability}</div>
          {addToCartBtn}
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
};

export default ProductShow;
