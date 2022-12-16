import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { withRouter, useLocation, Link } from "react-router-dom";
import { fetchProducts } from "../../store/product";
import "./SearchResult.css";

const SearchResult = () => {
  const searchProducts = useSelector((wholeState) => {
    return wholeState.products;
  });

  const dispatch = useDispatch();

  let location = useLocation();

  let searchExtractParams = new URLSearchParams(location.search);

  let searchCompareRef = searchExtractParams
    .get("results")
    .replace("+", " ")
    .toLowerCase();

  useEffect(() => {
    dispatch(fetchProducts);
  });

  let counter = 0;
  let searchDeclare = "";
  !searchCompareRef
    ? (searchDeclare = "All Categories")
    : (searchDeclare = searchCompareRef);

  return (
    <div className="search-res-comp">
      <div className="search-header-container">
        <h1>Here are your results for "{searchDeclare}"</h1>
      </div>
      <div className="search-results-container">
        <ul className="search-products-list-container">
          {Object.values(searchProducts)?.map((productEle) => {
            const productName = productEle.productName.toLowerCase();
            if (productName.includes(searchCompareRef)) {
              counter += 1;
              return (
                <li
                  className="li-search-results"
                  key={productEle.id.toString()}
                >
                  <div className="search-results-links">
                    <Link
                      className="cap-link"
                      to={`/products/${productEle.id}`}
                    >
                      <div className="search-result-image-container">
                        <img
                          src={productEle.photoUrl}
                          alt={`${productEle.name}`}
                          className="product-index-thumbnail"
                        />
                      </div>
                      <br />
                      <h1 className="search-result-title">
                        {productEle.productName}
                      </h1>
                      <p className="search-results-price">
                        ${productEle.price}
                      </p>
                    </Link>
                  </div>
                </li>
              );
            }
          })}
        </ul>
      </div>
      {!counter ? (
        <div className="search-footer-container">
          <div className="search-error-bg"></div>
          <div className="search-error-text">
            <h1>Error can't find "{searchCompareRef}"</h1>
            <br />
            <span>
              Try searching something else instead? ***fix message during
              styling
            </span>
          </div>
        </div>
      ) : null}
    </div>
  );
};

export default withRouter(SearchResult);
