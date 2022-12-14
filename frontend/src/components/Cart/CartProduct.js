import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from "react-router-dom";
import { removeCart, updateCart } from "../../store/cart";

function CartProduct({ product }) {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);
  const [count, setCount] = useState(product.quantity);
  const [alert, setAlert] = useState(false);

  const handleClick = (e) => {
    e.preventDefault();
    dispatch(removeCart(product.id));
  };

  const clickPlusButton = (e) => {
    if (count < product.stock) {
      setAlert(false);
      setCount(count + 1);
      dispatch(
        updateCart(product.id, product.productId, count + 1, sessionUser.id)
      );
    } else {
      setAlert(true);
    }
  };

  const clickMinusButton = (e) => {
    if (count > 0) {
      setAlert(false);
      setCount(count - 1);
      dispatch(
        updateCart(product.id, product.productId, count - 1, sessionUser.id)
      );
    } else if (isNaN(e)) {
      setCount(0);
    }
  };

  // const stringToNum = (e) => {
  //   setCount(parseInt(e.target.value));
  //   setAlert(false);
  // };

  if (!product) return null;
  return (
    <li key={product.id} className="cart-item">
      <div className="each-item">
        <div className="cart-item-main">
          <div className="cart-item-img">
            <img src={product.photoUrl} alt="" />
          </div>
          <div className="cart-item-name">
            <Link
              className="cart-item-name-link"
              to={`/products/${product.productId}`}
            >
              {product.product}
            </Link>
            <div className="cart-remove-button">
              <button onClick={handleClick}>Remove</button>
            </div>
          </div>

          <div className="cart-amount-container">
            <div className="cart-amount">
              <button
                className="cart-additem-button"
                onClick={clickMinusButton}
              >
                -
              </button>
              <input
                id="enter-box"
                type="text"
                value={count}
                required
                min="0"
                disabled
              />
              <button className="cart-additem-button" onClick={clickPlusButton}>
                +
              </button>
            </div>
            <div id="cart-stock">Stock: {product.stock}</div>
            {alert && <div className="cart-alert">Exceed stock limit</div>}
          </div>

          <div className="cart-prices">
            ${(product.price * count).toFixed(2)}
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
              placeholder={`Add a note to ${product.firstName}(optional)`}
            ></textarea>
            <div>
              <span id="shipping-info">
                Shipping:<p> Free</p>
              </span>
              <Link className="cart-explore" to={`/shops/${product.sellerId}`}>
                Explore more on this store →
              </Link>
            </div>
          </div>
        </div>
        <hr />
      </div>
    </li>
  );
}

export default CartProduct;
