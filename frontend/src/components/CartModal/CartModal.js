import * as React from "react";
import { useState } from "react";
import { addToCart } from "../../store/cart";
import { useDispatch, useSelector } from "react-redux";
import { Link, useParams } from "react-router-dom";
import "./CartModal.css";
import Modal from "@mui/material/Modal";
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import EastIcon from "@mui/icons-material/East";

const style = {
  position: "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 400,
  bgcolor: "background.paper",
  // border: "2px solid #000",
  boxShadow: 44,
  borderRadius: "10px",
  p: 4,
};

export default function CartModal({ prop }) {
  const [open, setOpen] = useState(false);
  const [message, setMessage] = useState("");
  const [error, setError] = useState(false);
  const dispatch = useDispatch();
  const handleClose = () => setOpen(false);
  // console.log(prop);
  const cart = useSelector((state) =>
    state.cart ? Object.values(state.cart) : []
  );
  const productId = useParams();

  let cart_quantity = 0;
  cart.forEach((cart) => {
    if (cart.productId === parseInt(productId.productId)) {
      // console.log(parseInt(productId.productId));
      cart_quantity = cart.quantity;
    }
  });

  let total = prop.quantity + cart_quantity;

  const add_to_cart = (e) => {
    e.preventDefault();
    if (total <= prop.availability) {
      setMessage(`${prop.quantity} item(s) added to cart`);
      dispatch(addToCart(prop.productId, prop.quantity, prop.currentUserId));
      setOpen(true);
      setError(false);
    } else {
      setError(true);
    }
  };

  return (
    <div>
      <Button id="add-btn" onClick={add_to_cart}>
        Add to cart
      </Button>
      {!error && (
        <Modal
          open={open}
          onClose={handleClose}
          aria-labelledby="modal-modal-title"
          aria-describedby="modal-modal-description"
        >
          <Box sx={style} className="cart-modal">
            <Typography id="modal-modal-title" variant="h6" component="h2">
              Added to cart!
            </Typography>
            <Typography className="modal-modal-description" sx={{ mt: 2 }}>
              {message}.
              <Link to="/cart" id="view-cart-btn">
                View cart & checkout{" "}
              </Link>
              <span onClick={handleClose} id="keep-shopping-btn">
                Continue shopping <EastIcon sx={{ fontSize: 20 }} />
              </span>
            </Typography>
          </Box>
        </Modal>
      )}
      {error && (
        <div className="cart-error-message">Purchase limit exceeded</div>
      )}
    </div>
  );
}
