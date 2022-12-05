import React from "react";
import { Switch, Route } from "react-router-dom";
import LandingPage from "./components/landingpage";
import "./reset.css";

function App() {
  return (
    <div className="LandingApp">
      <Switch>
        <Route path="/">
          <LandingPage />
        </Route>
      </Switch>
    </div>
  );
}

export default App;
