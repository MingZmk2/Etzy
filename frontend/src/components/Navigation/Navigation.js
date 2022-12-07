import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import ProfileButton from "../ProfileButton/ProfileButton";
import UserModal from "../UserModal/UserModal";

import "./Navigation.css";

function Navigation() {
  const sessionUser = useSelector((state) => state.session.user);

  const dispatch = useDispatch();

  let sessionLinks;
  if (sessionUser) {
    sessionLinks = <ProfileButton user={sessionUser} />;
  } else {
    let message = {
      text: "Sign in",
      type: "sign-in-button",
    };
    sessionLinks = (
      <>
        <UserModal message={message} />
      </>
    );
  }

  return (
    <div className="header-wrapper">
      <div className="header-main">
        <div className="header">
          <div>
            <Link to="/" className="logo">
              <div>Etzy</div>
            </Link>
          </div>
          <div className="header_option">{sessionLinks}</div>
        </div>
      </div>
    </div>
  );
}

export default Navigation;
