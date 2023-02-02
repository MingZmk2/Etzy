import React from "react";
import HandshakeIcon from "@mui/icons-material/Handshake";
import "./CartHeader.css";

function CartHeader() {
  return (
    <div className="cart-policy-wrapper">
      <div className="cart-policy-container">
        <div className="cart-policy">
          <HandshakeIcon
            className="cart-policy-icon"
            color="action"
            sx={{ fontSize: 40 }}
          />
          <p>
            Etzy Purchase Protection: Shop confidently on Etzy knowing if
            something goes wrong with an order, we've got your back.
          </p>
        </div>
      </div>
    </div>
  );
}

export default CartHeader;
