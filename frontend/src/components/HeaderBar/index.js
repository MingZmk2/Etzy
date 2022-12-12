import React from "react";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";
import "./index.css";

export default function HeaderBar() {
  const sessionUser = useSelector((state) => state.session.user); //currentuser

  const headerMessage = "Find your inner peace with a couple of goods.";

  if (sessionUser) {
    headerMessage = `Welcome back, ${sessionUser.username}!`;
  }

  return (

  );
}
