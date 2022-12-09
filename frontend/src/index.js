import React from "react";
import { Provider } from "react-redux";
import ReactDOM from "react-dom/client";
import { BrowserRouter } from "react-router-dom";
import App from "./App";
import configureStore from "./store";
import {
  createUser,
  loginUser,
  logoutUser,
  restoreSession,
} from "./store/session";
import { ModalProvider } from "./context/Modal";
import "./index.css";
import "./reset.css";

window.createUser = createUser;
window.loginUser = loginUser;
window.logoutUser = logoutUser;

const store = configureStore();

const initializeApp = () => {
  const root = ReactDOM.createRoot(document.getElementById("root"));
  root.render(
    <React.StrictMode>
      <BrowserRouter>
        <Provider store={store}>
          <ModalProvider>
            <App />
          </ModalProvider>
        </Provider>
      </BrowserRouter>
    </React.StrictMode>
  );
};

if (
  sessionStorage.getItem("currentUser") === null ||
  sessionStorage.getItem("X-CSRF-Token") === null
) {
  store.dispatch(restoreSession()).then(initializeApp);
} else {
  initializeApp();
}
