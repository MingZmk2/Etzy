import React from "react";
import { useDispatch } from "react-redux";
import * as sessionActions from "../../store/session";
import "./DemoUser.css";

function DemoUser() {
  const dispatch = useDispatch();

  const handleClick = (e) => {
    e.preventDefault();
    return dispatch(
      sessionActions.login({
        credential: "jack@jack.com",
        password: "password",
      })
    );
  };

  return (
    <button onClick={handleClick} className="demo_button" type="submit">
      Demo User
    </button>
  );
}

export default DemoUser;
