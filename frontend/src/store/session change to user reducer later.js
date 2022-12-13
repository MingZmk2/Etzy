// import csrfFetch from "./csrf";
// import { LOGIN_USER } from "./users";

// export const GET_USERS = "users/getUsers";
// export const GET_USER = "users/getUser";

// export const setUsers = (users) => ({
//   type: GET_USERS,
//   payload: users,
// });
// export const setUser = (user) => ({
//   type: GET_USER,import csrfFetch from "./csrf";

//   export const LOGIN_USER = "session/LOGIN_USER";
//   export const LOGOUT_USER = "session/LOGOUT_USER";

//   const loginUser = (payload) => {
//       console.log(payload);
//       return {
//         type: LOGIN_USER,
//         payload
//       }
//     // }
//   }

//   const logoutUser = () => {
//     return {
//       type: LOGOUT_USER
//     }
//   }

//   export const login = ({credential,password}) => async dispatch => {
//     const res = await csrfFetch('/api/session', {
//       method: 'POST', //create a new session/login
//       body: JSON.stringify({credential, password})
//     })
//     if (res.ok) {
//       const data = await res.json();
//       sessionStorage.setItem("currentUser", JSON.stringify(data))
//       dispatch(loginUser(data));
//     }
//   }

//   export const logout = () => async dispatch => {
//     const res = await csrfFetch('/api/session', {
//       method: 'DELETE'
//     })
//       storeCurrentUser(null)
//       // sessionStorage.removeItem("currentUser")
//       dispatch(logoutUser())
//       return res
//   }

//   export const restoreSession = () => async dispatch => {
//     const res = await csrfFetch('/api/session') //did what restoreCSRF did, provide Xtoken
//     storeCSRFToken(res) //
//     const data = await res.json() //from a promise to json
//     storeCurrentUser(data)
//     if(data.user !== null){
//       dispatch(loginUser(data));
//     }
//   }

//   const storeCurrentUser = (user) => {
//     if (user === undefined) {
//       sessionStorage.setItem("currentUser", JSON.stringify(user))
//     } else {
//       sessionStorage.setItem("currentUser", null)
//     }

//   }

//   export function storeCSRFToken(responseObj) {
//     const csrfToken = responseObj.headers.get('X-CSRF-Token');
//     if (csrfToken) sessionStorage.setItem('X-CSRF-Token', csrfToken);
//   }
//   export const signup = (user) => async dispatch => {
//     const { username, email, password} = user
//     const res = await csrfFetch(`/api/users`, {
//       method: 'POST',
//       body: JSON.stringify({
//         username,
//         email,
//         password
//       })
//     });
//     const data = await res.json();
//     storeCurrentUser(data.user)
//     dispatch(loginUser(data))
//     return res
//   }

//   export default function sessionReducer (state = {user: JSON.parse(sessionStorage.getItem("currentUser"))}, action) {
//     Object.freeze(state)
//     let newState = {...state}
//     switch (action.type) {
//       case LOGIN_USER:
//         newState = {}
//         newState['user'] = action.payload;
//         return newState;
//       case LOGOUT_USER:
//         newState['user'] = null;
//         return newState;
//       default:
//         return state;
//     }
//   }
//   user,
// });

// export const getUsers = (state) => {
//   return Object.values(state.users);
// };

// export const getUser =
//   (userId) =>
//   ({ users }) =>
//     users ? users[userId] : null;

// export const fetchUsers = () => async (dispatch) => {
//   const res = await csrfFetch(`/api/users`);
//   if (res.ok) {
//     const data = await res.json();
//     dispatch(setUsers(data));
//   }
// };
// export const fetchUser = (userId) => async (dispatch) => {
//   const res = await csrfFetch(`/api/users/${userId}`);
//   if (res.ok) {
//     const data = await res.json();
//     dispatch(setUser(data));
//   }
// };

// const usersReducer = (state = {}, action) => {
//   Object.freeze(state);
//   switch (action.type) {
//     case LOGIN_USER:
//       return { ...state, ...action.payload.user };
//     case GET_USERS:
//       return { ...state, ...action.payload.users };
//     case GET_USER:
//       return { ...state, [action.user.id]: action.user };
//     default:
//       return state;
//   }
// };

// export default usersReducer;
