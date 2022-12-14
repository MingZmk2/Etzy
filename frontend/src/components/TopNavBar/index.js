import { useState } from "react";
import { FormsModal } from "../FormsModal";
import { useDispatch, useSelector } from "react-redux";
import { logoutUser } from "../../store/session";
import { Link } from "react-router-dom";
import "./index.css";
import SearchBar from "./SearchBar";

export default function TopNavBar() {
  const dispatch = useDispatch();
  const currentUser = useSelector((state) => state.session.user);

  const [modalOpen, setModalOpen] = useState(false);

  return (
    <>
      {modalOpen ? (
        <FormsModal
          onSuccess={() => {
            setModalOpen(false);
          }}
          onClose={() => setModalOpen(false)}
        />
      ) : null}

      <div className="nav-bar">
        <div className="logo">
          <Link to="/">Etzy</Link>
        </div>

        <SearchBar />

        {!currentUser && (
          <button onClick={() => setModalOpen(true)} className="signin-btn">
            Sign in
          </button>
        )}

        <div className="account-btn">
          {currentUser && (
            <button className="profile-btn">
              <img
                src="https://img2.etsystatic.com/site-assets/images/global-nav/no-user-avatar.svg"
                alt="User's avatar"
              />
            </button>
          )}
          <ul className="dropdown-content">
            <li onClick={() => dispatch(logoutUser())}>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                aria-hidden="true"
                focusable="false"
              >
                <path d="M2.7 11.3L2 12l.7.7 4 4c.4.4 1 .4 1.4 0 .4-.4.4-1 0-1.4L5.8 13H15c.6 0 1-.4 1-1s-.4-1-1-1H5.8l2.3-2.3c.2-.2.3-.4.3-.7 0-.6-.4-1-1-1-.3 0-.5.1-.7.3l-4 4z"></path>
                <path d="M22 19H10v-2h10V7H10V5h12z"></path>
              </svg>
              <Link to={"/"}>
                <span>Sign out</span>
              </Link>
            </li>
          </ul>
        </div>

        <Link to="/cart">
          <button className="cart-btn">
            <svg xmlns="http://www.w3.org/2000/svg">
              <path d="M9 22a2 2 0 100-4 2 2 0 000 4zm7 0a2 2 0 100-4 2 2 0 000 4zm5-17H5.665l-.687-3.21A1 1 0 004 1H1a1 1 0 000 2h2.191l2.831 13.21a.962.962 0 00.064.159c.017.053.038.105.063.155a.979.979 0 00.133.153.926.926 0 00.088.1c.058.041.12.077.185.105.034.022.07.042.107.06A.993.993 0 007 17h11a1 1 0 00.958-.713l3-10A1.001 1.001 0 0021 5zm-2.244 5H16V7h3.656l-.9 3zM7.819 15l-.6-3H9v3H7.819zM11 12h3v3h-3v-3zm0-2V7h3v3h-3zM9 7v3H6.82l-.6-3H9zm8.256 8H16v-3h2.156l-.9 3z"></path>
            </svg>
          </button>
        </Link>
      </div>
    </>
  );
}
