async function csrfFetch(url, options = {}) {
  // set options.method to 'GET' if there is no method
  options.method = options.method || "GET";
  // set options.headers to an empty object if there are no headers
  options.headers = options.headers || {};

  if (options.method.toUpperCase() !== "GET") {
    options.headers["Content-Type"] =
      options.headers["Content-Type"] || "application/json";
    options.headers["X-CSRF-Token"] = sessionStorage.getItem("X-CSRF-Token");
  }

  // call fetch with the url and the updated options hash
  const res = await fetch(url, options);

  // if the response status code is 400 or above, then throw an error with the
  // error being the response
  if (res.status >= 400) throw res;

  return res;
}
export function storeCSRFToken(response) {
  const csrfToken = response.headers.get("X-CSRF-Token");
  if (csrfToken) sessionStorage.setItem("X-CSRF-Token", csrfToken);
}

export async function restoreCSRF() {
  const response = await csrfFetch("/api/session");
  storeCSRFToken(response);
  return response;
}
export default csrfFetch;
