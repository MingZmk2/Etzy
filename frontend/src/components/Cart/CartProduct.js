import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from "react-router-dom";
import { removeCart, updateCart } from "../../store/cart";
import "./CartProduct.css";

function CartProduct({ product }) {
  const dispatch = useDispatch();
  const currentUser = useSelector((state) => state.session.user);
  const [currentQuantity, setNewQuantity] = useState(product.quantity);

  let numsArr = [];

  for (let i = 1; i <= product.stock; i++) {
    numsArr.push(i);
  }

  const handleClick = (e) => {
    e.preventDefault();
    dispatch(removeCart(product.id));
  };

  const handleUpdateQuantity = (e) => {
    e.preventDefault();

    let newQuantity = parseInt(e.target.value);
    setNewQuantity(newQuantity);
    dispatch(
      updateCart(product.id, product.productId, newQuantity, currentUser.id)
    );
  };

  if (!product) return null;

  return (
    <li key={product.id} className="cart-product">
      <div className="each-product">
        <div className="cart-product-main">
          <div className="cart-product-img">
            <img src={product.img} alt="" />
          </div>
          <div className="cart-product-name">
            <Link
              className="cart-product-name-link"
              to={`/products/${product.productId}`}
            >
              {product.product}
            </Link>
            <div className="cart-remove-button">
              <button onClick={handleClick}>Remove</button>
            </div>
          </div>

          <div className="cart-amount-dropdown-container">
            <select
              name="quantity"
              id="quanitity"
              value={currentQuantity}
              className="checkout-dropdown"
              onChange={handleUpdateQuantity}
            >
              {numsArr.map((option, i) => {
                return (
                  <option value={option} key={i}>
                    {option}
                  </option>
                );
              })}
            </select>
          </div>

          <div className="cart-prices">
            ${(product.price * currentQuantity).toFixed(2)}
          </div>
        </div>
        <div className="order-options">
          <form>
            <input type="checkbox" />
            This order is a gift
          </form>
          <div className="cart-note">
            <textarea
              name="message to seller"
              placeholder={`Add a note (optional)`}
            ></textarea>
            <div>
              <span id="shipping-info">
                Shipping:<p> Free</p>
              </span>
            </div>
          </div>
        </div>
        <hr />
      </div>
    </li>
  );
}

export default CartProduct;
