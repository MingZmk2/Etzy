import { useState } from "react";
import { useDispatch } from "react-redux";
import { loginUser } from "../../store/userReducer";

export default function LoginForm({ onSuccess }) {
  const dispatch = useDispatch();
  const [formValues, setFormValues] = useState({
    email: "",
    password: "",
  });

  const handleChange = (e) => {
    setFormValues((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const user = {
      email: formValues.email,
      password: formValues.password,
    };
    dispatch(loginUser(user));
    onSuccess();
  };

  return (
    <>
      <h1>Log In</h1>
      <form onSubmit={handleSubmit}>
        <label>
          email
          <input
            type="email"
            value={formValues.email}
            name="email"
            id="email"
            onChange={handleChange}
          />
        </label>

        <label>
          password
          <input
            type="password"
            value={formValues.password}
            name="password"
            id="password"
            onChange={handleChange}
          />
        </label>

        <button type="submit">Sign in</button>
      </form>
    </>
  );
}
