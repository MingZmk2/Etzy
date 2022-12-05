import csrfFetch from "./csrf";

// ACTION TYPES
const RECEIVE_USER = "users/RECEIVE_USER";
const REMOVE_USER = "users/REMOVE_USER";

// ACTION CREATORS
export const receiveUser = (user) => ({
  type: RECEIVE_USER,
  payload: user,
});

export const removeUser = () => ({
  type: REMOVE_USER,
  // payload: userId,
});

let currentUser = JSON.parse(sessionStorage.getItem("currentUser"));
let initialState = {
  current: null,
};
if (currentUser) {
  initialState = {
    current: currentUser,
  };
}

export async function restoreCSRF() {
  const response = await csrfFetch("/api/session");
  storeCSRFToken(response);
  return response;
}

export const restoreSession = () => async (dispatch) => {
  const response = await csrfFetch("/api/session");
  storeCSRFToken(response);
  const data = await response.json();
  storeCurrentUser(data.user);
  if (data.user) {
    dispatch(receiveUser(data.user));
  }
};

function storeCSRFToken(response) {
  const csrfToken = response.headers.get("X-CSRF-Token");
  if (csrfToken) {
    sessionStorage.setItem("X-CSRF-Token", csrfToken);
  }
}

function storeCurrentUser(user) {
  if (user) {
    sessionStorage.setItem("currentUser", JSON.stringify(user));
  } else {
    sessionStorage.removeItem("currentUser");
  }
}

// THUNK ACTION CREATORS
export const loginUser = (user) => async (dispatch) => {
  let res = await csrfFetch("/api/session", {
    method: "POST",
    body: JSON.stringify(user),
  });
  let data = await res.json();
  sessionStorage.setItem("currentUser", JSON.stringify(data.user));
  dispatch(receiveUser(data.user));
};

export const logoutUser = () => async (dispatch) => {
  await csrfFetch("/api/session", {
    method: "DELETE",
  });
  sessionStorage.setItem("currentUser", null);
  dispatch(removeUser());
};

export const createUser = (user) => async (dispatch) => {
  let res = await csrfFetch("/api/users", {
    method: "POST",
    body: JSON.stringify(user),
  });
  let data = await res.json();
  sessionStorage.setItem("currentUser", JSON.stringify(data.user));
  dispatch(receiveUser(data.user));
};

// REDUCER
const userReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_USER: {
      return {
        ...state,
        current: action.payload,
      };
    }
    case REMOVE_USER: {
      return { ...state, current: null };
    }
    default:
      return state;
  }
};

export default userReducer;
