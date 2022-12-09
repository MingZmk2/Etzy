import { useState } from "react";
import { Modal } from "../../context/modal";
import LoginForm from "../LoginForm";
import SignupForm from "../SignupForm";
import "./index.css";

export function FormsModal({ onClose, onSuccess }) {
  const [modal, setModal] = useState("login");

  return (
    <Modal onClose={onClose}>
      <button onClick={onClose} className="close-btn">
        &times;
      </button>
      {modal === "login" && (
        <button className="register-btn" onClick={() => setModal("register")}>
          Register
        </button>
      )}
      {modal === "login" ? (
        <div className="session-modal">
          <LoginForm onSuccess={onSuccess} />
        </div>
      ) : (
        <div className="register-modal">
          <SignupForm onSuccess={onSuccess} />
        </div>
      )}
    </Modal>
  );
}
