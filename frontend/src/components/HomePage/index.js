import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchProducts, getProducts } from "../../store/product";
import HeaderBar from "../HeaderBar";
import SingleProductTile from "../SingleProductTile";
import _ from "underscore";
import "./index.css";

function HomePage() {
  const dispatch = useDispatch();

  const products = useSelector(getProducts);

  //create logic to randomize the 2x5 tiles
  //use underscore.js to randomize the seed products
  const productListTiles = _.sample(products, 10).map((product) => (
    <SingleProductTile key={product.id} product={product}></SingleProductTile>
  ));
  // console.log(productListTiles);
  console.log(products);
  // debugger;
  useEffect(() => {
    dispatch(fetchProducts());
  }, []);

  return (
    <div className="home-page">
      <div className="header-bar-container">
        <HeaderBar />
      </div>

      <div className="second-section">
        <div className="product-tiles-wrapper">
          <div>
            <h3>Recently viewed & more</h3>
          </div>
          <ul className="product-list-tiles">{productListTiles}</ul>
        </div>
      </div>

      <div className="footer">
        <ul className="right-footer">
          <li>&#169; Ming's Etzy</li>
        </ul>
      </div>
    </div>
  );
}

export default HomePage;

// <div className="home-page">
//   <div className="text-container">
//     <h1 className="title-display"></h1>
//     <div className="products-circle-index-section">
//       <ul className="displays">
//         <li className="display">
//           <img src="https://i.etsystatic.com/17383854/r/il/ad863d/2999132673/il_1588xN.2999132673_aihm.jpg" />
//           <span className="text1">Product 1</span>
//         </li>
//         <li className="display">
//           <img src="https://i.etsystatic.com/22865890/r/il/c7fc1d/2363927609/il_1588xN.2363927609_pw1w.jpg" />
//           <span className="text2">Product 2</span>
//         </li>
//         <li className="display">
//           <img src="https://i.etsystatic.com/18673084/r/il/06fcd3/1741211311/il_1588xN.1741211311_hgxe.jpg" />
//           <span className="text3">Product 3</span>
//         </li>
//         <li className="display">
//           <img src="https://i.etsystatic.com/9099792/r/il/0db648/1289794405/il_1588xN.1289794405_jl4k.jpg" />
//           <span className="text4">Product 4</span>
//         </li>
//         <li className="display">
//           <img src="https://i.etsystatic.com/16440268/r/il/ac6f1b/3161272310/il_1588xN.3161272310_9h7q.jpg" />
//           <span className="text5">Product 5</span>
//         </li>
//         <li className="display">
//           <img src="https://i.etsystatic.com/15221934/r/il/0b5d55/3273536047/il_1588xN.3273536047_eqt4.jpg" />
//           <span className="text6">Product 6</span>
//         </li>
//       </ul>
//     </div>
//   </div>
