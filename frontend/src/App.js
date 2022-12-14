import { Switch, Route } from "react-router-dom";
import TopNavBar from "./components/TopNavBar";
import HomePage from "./components/HomePage";
import ProductShow from "./components/Product/ProductShow";
import Cart from "./components/Cart";
import CartEmpty from "./components/Cart/CartEmpty";
import CartHeader from "./components/Cart/CartHeader";

// potentially import category component for bonus feature

function App() {
  return (
    <div className="App">
      <TopNavBar />

      <Switch>
        <Route exact path={"/"}>
          <HomePage />
        </Route>
        <Route exact path="/products/:productId">
          <ProductShow />
        </Route>
        <Route exact path="/cart">
          <Cart />
        </Route>
        <Route exact path="/checkout">
          <CartHeader />
          <CartEmpty message="checkout" />
        </Route>
      </Switch>
    </div>
  );
}

export default App;
