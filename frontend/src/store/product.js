import { csrfFetch } from "./csrf";

const RECEIVE_PRODUCT = "product/RECEIVE_PRODUCT";
const RECEIVE_PRODUCTS = "product/RECEIVE_PRODUCTS";

const receiveProducts = (products) => ({
  type: RECEIVE_PRODUCTS,
  products,
});

const receiveProduct = (product) => ({
  type: RECEIVE_PRODUCT,
  product,
});

//useSelectors
export const getProducts = (state) => {
  // debugger;
  return state.products ? Object.values(state.products) : [];
};

export const getProduct = (productId) => (state) =>
  state.products ? state.products[productId] : null;

export const fetchProducts = () => async (dispatch) => {
  const res = await csrfFetch("/api/products");
  const data = await res.json();
  dispatch(receiveProducts(data));
  return res;
};

export const fetchProduct = (productId) => async (dispatch) => {
  const res = await csrfFetch(`/api/products/${productId}`);
  const data = await res.json();
  dispatch(receiveProduct(data));
  return res;
};

const productReducer = (state = {}, action) => {
  const newState = { ...state };
  switch (action.type) {
    case RECEIVE_PRODUCT:
      // debugger;
      newState[action.product.id] = action.product;
      return newState;
    case RECEIVE_PRODUCTS:
      return { ...newState, ...action.products };
    default:
      return state;
  }
};

export default productReducer;
