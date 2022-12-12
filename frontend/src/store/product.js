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
export const getProducts = ({ product }) =>
  product ? Object.values(product) : [];

export const getProduct =
  (productId) =>
  ({ product }) =>
    product ? product[productId] : null;

export const fetchProducts = () => async (dispatch) => {
  const res = await csrfFetch("/api/products");
  if (res.ok) {
    const data = await res.json();
    dispatch(receiveProducts(data));
  }
};

export const fetchProduct = (productId) => async (dispatch) => {
  const res = await csrfFetch(`/api/products/${productId}`);
  if (res.ok) {
    const data = await res.json();
    dispatch(receiveProduct(data));
  }
};

const productReducer = (state = {}, action) => {
  const newState = { ...state };
  switch (action.type) {
    case RECEIVE_PRODUCT:
      newState[action.product.id] = action.product;
      return newState;
    case RECEIVE_PRODUCTS:
      return { ...newState, ...action.products };
    default:
      return state;
  }
};

export default productReducer;
