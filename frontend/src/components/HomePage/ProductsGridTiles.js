import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import "./ProductsGridTiles.css";
import { fetchProducts, getProducts } from "../../store/product";
import { Link } from "react-router-dom";

export default function ProductsGridTiles() {
  const dispatch = useDispatch();
  const products = useSelector(getProducts);

  const productTile = products.slice(22, 30);

  useEffect(() => {
    dispatch(fetchProducts());
  }, [dispatch]);

  // debugger;
  // console.log(productTile);
  // console.log(productTile[0]);

  return (
    <div className="product-grid-tiles">
      <div className="tile product-grid-1">
        <div className="product">
          <Link className="product-img" to={`/products/${productTile[0]?.id}`}>
            <img src={productTile[0]?.photoUrl} alt="" />
            <div className="product-price">${productTile[0]?.price}</div>
          </Link>
        </div>
      </div>

      <div className="tile product-grid-2">
        <div className="product">
          <Link className="product-img" to={`/products/${productTile[1]?.id}`}>
            <img src={productTile[1]?.photoUrl} alt="" />
            <div className="product-price">${productTile[1]?.price}</div>
          </Link>
        </div>
      </div>

      <div className="tile product-grid-3">
        <div className="product">
          <Link className="product-img" to={`/products/${productTile[2]?.id}`}>
            <img src={productTile[2]?.photoUrl} alt="" />
            <div className="product-price">${productTile[2]?.price}</div>
          </Link>
        </div>
      </div>
      <div className="tile product-grid-4">
        <div className="product">
          <Link className="product-img" to={`/products/${productTile[3]?.id}`}>
            <img src={productTile[3]?.photoUrl} alt="" />
            <div className="product-price">${productTile[3]?.price}</div>
          </Link>
        </div>
      </div>
      <div className="tile product-grid-5">
        <div className="product">
          <Link className="product-img" to={`/products/${productTile[4]?.id}`}>
            <img src={productTile[4]?.photoUrl} alt="" />
            <div className="product-price">${productTile[4]?.price}</div>
          </Link>
        </div>
      </div>
      <div className="tile product-grid-6">
        <div className="product">
          <Link className="product-img" to={`/products/${productTile[5]?.id}`}>
            <img src={productTile[5]?.photoUrl} alt="" />
            <div className="product-price">${productTile[5]?.price}</div>
          </Link>
        </div>
      </div>
      <div className="tile product-grid-7">
        <div className="product">
          <Link className="product-img" to={`/products/${productTile[6]?.id}`}>
            <img src={productTile[6]?.photoUrl} alt="" />
            <div className="product-price">${productTile[6]?.price}</div>
          </Link>
        </div>
      </div>
      <div className="tile product-grid-8">
        <div className="product">
          <Link className="product-img" to={`/products/${productTile[7]?.id}`}>
            <img src={productTile[7]?.photoUrl} alt="" />
            <div className="product-price">${productTile[7]?.price}</div>
          </Link>
        </div>
      </div>
    </div>
  );
}
