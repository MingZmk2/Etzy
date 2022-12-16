import { useState } from "react";
import { useDispatch } from "react-redux";
import { loginUser } from "../../store/session";
import "./index.css";

export default function LoginForm({ onSuccess }) {
  const dispatch = useDispatch();

  const [formValues, setFormValues] = useState({
    email: "",
    password: "",
  });

  const [errors, setErrors] = useState(null);
  const handleChange = (e) => {
    setFormValues((prev) => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const user = {
      email: formValues.email,
      password: formValues.password,
    };

    setErrors(null);
    dispatch(loginUser(user))
      .then((res) => {
        if (res.ok) {
          onSuccess();
        }
      })
      .catch(async (res) => {
        // const errors = await res.json();
        setErrors("Invalid email or password.");
      });
  };
  const handleDemoUser = () => {
    setErrors("");
    const user = {
      email: "lebron@james.com",
      password: "password",
    };
    dispatch(loginUser(user))
      .then((res) => {
        if (res.ok) {
          onSuccess();
        }
      })
      .catch(async (res) => {
        const errors = await res.json();
        setErrors(errors);
      });
  };

  return (
    <>
      <div className="login-grid">
        <div className="login-form">
          <h1 className="login-title">Sign In</h1>
          <form onSubmit={handleSubmit}>
            <div className="login-input">
              <label htmlFor="email">Email address</label>
              <input
                type="email"
                value={formValues.email}
                name="email"
                id="email"
                onChange={handleChange}
                className="email"
              />
            </div>

            <div className="password-input">
              <label>Password</label>
              <input
                type="password"
                value={formValues.password}
                name="password"
                id="password"
                onChange={handleChange}
                className="password"
              />
            </div>
            {errors && <div className="error-login">{errors}</div>}
            <button type="submit" className="submit-btn">
              Sign in
            </button>

            <button
              onClick={handleDemoUser}
              className="demo-user-btn"
              type="button"
            >
              Demo User
            </button>
          </form>
        </div>
      </div>
    </>
  );
}
