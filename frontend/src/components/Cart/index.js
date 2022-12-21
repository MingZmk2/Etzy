import React, { useEffect } from "react";
import CartHeader from "./CartHeader";
import CartEmpty from "./CartEmpty";
import { useDispatch, useSelector } from "react-redux";
import { fetchCart } from "../../store/cart";
import "./index.css";
import CartProduct from "./CartProduct";
import CartCheckout from "./CartCheckout";
import { Link } from "react-router-dom";

function Cart() {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);

  useEffect(() => {
    if (sessionUser) {
      dispatch(fetchCart(sessionUser.id));
    }
  }, [dispatch, sessionUser]);

  const cart = useSelector((state) =>
    state.cart ? Object.values(state.cart) : []
  );

  let total = 0;
  cart.forEach((element) => (total += element.quantity));

  if (!cart.length)
    return (
      <div>
        <CartHeader />
        <CartEmpty message="empty" />
        <hr />
      </div>
    );

  let cartProducts;

  if (sessionUser) {
    cartProducts = cart.map((product) => (
      <CartProduct key={product.productId} product={product}></CartProduct>
    ));
  }

  return (
    <div className="cart-wrapper">
      <div className="cart">
        {/* write conditonal for just one item header message*/}
        <h1>{total} items in your cart</h1>
        <Link to="/">Keep Shopping</Link>
        <CartHeader />
        <div className="cart-main">
          <ul>{cartProducts}</ul>
          <CartCheckout />
        </div>
        <hr />
      </div>
    </div>
  );
}

export default Cart;
