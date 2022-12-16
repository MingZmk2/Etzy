import csrfFetch from "./csrf";
import { SET_CURRENT_USER, REMOVE_CURRENT_USER } from "./session";

const FIND_CART = "cart/FIND_CART";
const ADD_CART = "cart/ADD_CART";
const REMOVE_CART = "cart/REMOVE_CART";

export const findCart = (cart) => ({
  type: FIND_CART,
  cart,
});

export const addCart = (cart) => ({
  type: ADD_CART,
  cart,
});

export const deleteCart = (cartId) => ({
  type: REMOVE_CART,
  cartId,
});

export const fetchCart = (userId) => async (dispatch) => {
  const res = await csrfFetch(`/api/users/${userId}`);
  const data = await res.json();
  dispatch(findCart(data.carts));
  return res;
};

export const addToCart =
  (product_id, quantity, buyer_id) => async (dispatch) => {
    const add_product = { product_id, quantity, buyer_id };
    const res = await csrfFetch("/api/cart_products", {
      method: "POST",
      body: JSON.stringify(add_product),
    });
    const data = await res.json();
    dispatch(addCart(data));
    // return res;
  };

export const updateCart =
  (cart_id, product_id, quantity, buyer_id) => async (dispatch) => {
    const add_product = { product_id, quantity, buyer_id };
    const res = await csrfFetch(`/api/cart_products/${cart_id}`, {
      method: "PATCH",
      body: JSON.stringify(add_product),
    });
    const data = await res.json();
    dispatch(addCart(data));
    // return res;
  };

export const removeCart = (cartId) => async (dispatch) => {
  const res = await csrfFetch(`/api/cart_products/${cartId}`, {
    method: "DELETE",
  });
  dispatch(deleteCart(cartId));
  // return res;
};

const cartReducer = (state = {}, action) => {
  const newState = { ...state };
  switch (action.type) {
    case SET_CURRENT_USER:
      return { ...newState, ...action.payload.carts };
    case REMOVE_CURRENT_USER:
      return {};
    case ADD_CART:
      return { ...newState, ...action.cart.carts };
    case REMOVE_CART:
      delete newState[action.cartId];
      return newState;
    case FIND_CART:
      return { ...newState, ...action.cart };
    default:
      return state;
  }
};

export default cartReducer;
