import LoginForm from "../session/LoginFormPage";
import SignupForm from "../session/SignupFormPage";
import { Modal } from "../../context/Modal";
import { useState } from "react";

export function AuthModal({ onClose, onSuccess }) {
  const [modal, setModal] = useState("login");

  return (
    <Modal onClose={onClose}>
      <button onClick={onClose}>X</button>
      {modal === "login" && (
        <button onClick={() => setModal("register")}>Register</button>
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
