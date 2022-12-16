import React, { useState } from "react";
import { withRouter, useLocation, useHistory } from "react-router-dom";
import "./SearchBar.css";

const SearchBar = () => {
  const [searchInput, setSearchInput] = useState("");
  const history = useHistory();
  const location = useLocation();

  const processUrl = new URLSearchParams(location.search);
  processUrl.set("results", searchInput);
  let processedUrlString = processUrl.toString();

  const handleSubmit = (e) => {
    e.preventDefault();
    history.push(`/search?${processedUrlString}`);
    setSearchInput("");
  };

  const updateSearchInput = (e) => {
    setSearchInput(e.currentTarget.value);
  };

  return (
    <form onSubmit={handleSubmit} className="search-form">
      <input
        type="search"
        placeholder="Search for anything"
        value={searchInput}
        className="search-bar"
        onChange={updateSearchInput}
      />
      <button type="submit" className="search-bar-btn">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 24 24"
          aria-hidden="true"
          focusable="false"
        >
          <path d="M10,18a8,8,0,1,1,8-8A8.009,8.009,0,0,1,10,18ZM10,4a6,6,0,1,0,6,6A6.007,6.007,0,0,0,10,4Z"></path>
          <path d="M21,22a1,1,0,0,1-.707-0.293l-4-4a1,1,0,0,1,1.414-1.414l4,4A1,1,0,0,1,21,22Z"></path>
        </svg>
      </button>
    </form>
  );
};

export default withRouter(SearchBar);
