import React from "react";
import LockIcon from "@mui/icons-material/Lock";
import { useDispatch, useSelector } from "react-redux";
// import visaicon from "../../img/visaicon.png"
import { removeCart } from "../../store/cart";
import { Link } from "react-router-dom";

import "./CartCheckout.css";

function CartCheckout() {
  const dispatch = useDispatch();

  const cart = useSelector((state) =>
    state.cart ? Object.values(state.cart) : []
  );

  let total = 0;
  cart.forEach((product) => (total += product.quantity * product.price));

  let total_products = 0;
  cart.forEach((product) => (total_products += product.quantity));

  //no need for discount for now
  let discount = 0;
  // (total + discount).toFixed(2)

  let Subtotal = (total + discount).toFixed(2);
  let totalPriceFixed = total.toFixed(2);

  const onSubmit = (e) => {
    e.preventDefault();
    cart.forEach((cart) => dispatch(removeCart(cart.id)));
  };

  return (
    <div className="cart-payment-section">
      <div className="secure-payment-header">
        <p>How you'll pay</p>
        <ul>
          <li>
            <input
              type="radio"
              id="visa-master-amex-"
              name="payment-method"
              value="Visa, Master, Amex, and Discover"
            />
            &nbsp;
            <label htmlFor="visa-master-amex-">
              Visa, Master, Amex, and Discover
              {/* <ul>
                <li>
                  <div>
                    <img src={window.visa} alt="" />
                  </div>
                </li>
                <li><img src="" alt="" /></li>
                <li><img src="" alt="" /></li>
              </ul> */}
            </label>
          </li>
          <li>
            <input
              type="radio"
              id="paypal"
              name="payment-method"
              value="Paypal"
            />
            &nbsp;
            <label htmlFor="paypal">Paypal</label>
          </li>
          <li>
            <input
              type="radio"
              id="klarna"
              name="payment-method"
              value="Klarna"
            />
            &nbsp;
            <label htmlFor="klarna">Klarna</label>
          </li>
        </ul>
      </div>
      <div id="visa-icon">{/* <img src={visaicon} alt="" /> */}</div>
      <div className="products-total">
        <span>Item(s) total</span>
        <p>${totalPriceFixed}</p>
      </div>
      <hr />
      <div className="products-total-sub">
        <p>Subtotal</p>
        <p>${Subtotal}</p>
      </div>
      <div className="products-total-sub">
        <p>Shipping</p>
        <p>Free</p>
      </div>
      <hr />
      <div className="products-total-item-price">
        <span>Total({total_products} items)</span>
        <span>${totalPriceFixed}</span>
      </div>
      <form className="checkout-button" onSubmit={onSubmit}>
        <Link to="/checkout" className="checkout-link">
          Proceed to checkout
        </Link>
      </form>
    </div>
  );
}

export default CartCheckout;
