import { Switch, Route } from "react-router-dom";
import NavBar from "./components/NavBar";
import HomePage from "./components/HomePage";

function App() {
  return (
    <div className="App">
      <NavBar />

      <Switch>
        <Route exact path={"/"}>
          <HomePage />
        </Route>
      </Switch>
    </div>
  );
}

export default App;
