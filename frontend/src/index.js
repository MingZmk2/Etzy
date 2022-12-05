import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import { Provider } from "react-redux";
import configureStore from "./store";
import {
  createUser,
  loginUser,
  logoutUser,
  restoreSession,
} from "./store/userReducer";
import { BrowserRouter } from "react-router-dom";
import { ModalProvider } from "./context/modal";
import "./index.css";

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
