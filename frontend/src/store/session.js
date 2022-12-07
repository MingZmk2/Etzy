import csrfFetch from "./csrf";

export const LOGIN_USER = "session/LOGIN_USER";
export const LOGOUT_USER = "session/LOGOUT_USER";

const loginUser = (payload) => {
  return {
    type: LOGIN_USER,
    payload,
  };
};

const logoutUser = () => {
  return {
    type: LOGOUT_USER,
  };
};

export const login =
  ({ credential, password }) =>
  async (dispatch) => {
    const res = await csrfFetch("/api/session", {
      method: "POST",
      body: JSON.stringify({ credential, password }),
    });
    if (res.ok) {
      const data = await res.json();
      sessionStorage.setItem("currentUser", JSON.stringify(data));
      dispatch(loginUser(data));
    }
  };

export const logout = () => async (dispatch) => {
  const res = await csrfFetch("/api/session", {
    method: "DELETE",
  });
  storeCurrentUser(null);
  dispatch(logoutUser());
  return res;
};

export const restoreSession = () => async (dispatch) => {
  const res = await csrfFetch("/api/session");
  storeCSRFToken(res);
  const data = await res.json();
  storeCurrentUser(data);
  if (data.user !== null) {
    dispatch(loginUser(data));
  }
};

const storeCurrentUser = (user) => {
  if (user === undefined) {
    sessionStorage.setItem("currentUser", JSON.stringify(user));
  } else {
    sessionStorage.setItem("currentUser", null);
  }
};

export function storeCSRFToken(responseObj) {
  const csrfToken = responseObj.headers.get("X-CSRF-Token");
  if (csrfToken) sessionStorage.setItem("X-CSRF-Token", csrfToken);
}
export const signup = (user) => async (dispatch) => {
  const { firstname, email, password } = user;
  const res = await csrfFetch(`/api/users`, {
    method: "POST",
    body: JSON.stringify({
      firstname,
      email,
      password,
    }),
  });
  const data = await res.json();
  storeCurrentUser(data.user);
  dispatch(loginUser(data));
  return res;
};

export default function sessionReducer(
  state = { user: JSON.parse(sessionStorage.getItem("currentUser")) },
  action
) {
  Object.freeze(state);
  let newState = { ...state };
  switch (action.type) {
    case LOGIN_USER:
      newState = {};
      newState["user"] = action.payload;
      return newState;
    case LOGOUT_USER:
      newState["user"] = null;
      return newState;
    default:
      return state;
  }
}
