import { Switch, Route } from "react-router-dom";
import TopNavBar from "./components/TopNavBar";
import HomePage from "./components/HomePage";
import ProductShow from "./components/Product/ProductShow";

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
      </Switch>
    </div>
  );
}

export default App;
