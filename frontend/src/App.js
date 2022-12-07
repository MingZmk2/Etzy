import React from "react";
import { Route, Switch } from "react-router-dom";
import Navigation from "./components/Navigation/Navigation";

import "./App.css";

function App() {
  return (
    <div className="app">
      <Switch>
        <Route exact path="/">
          <Navigation className="navigation" />
          {/* <LandingPage /> */}
        </Route>
      </Switch>
    </div>
  );
}

export default App;
