import { useState } from "react";
import { useDispatch } from "react-redux";
import { signupUser } from "../../store/session";
import "./index.css";

export default function SignupForm({ onSuccess }) {
  const dispatch = useDispatch();

  const [formValues, setFormValues] = useState({
    email: "",
    firstname: "",
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
      first_name: formValues.firstname,
    };

    setErrors(null);
    dispatch(signupUser(user))
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
      <h2 className="signup-title">Create Your account</h2>
      <h3 className="signup-description">Registration is easy.</h3>
      <form onSubmit={handleSubmit}>
        <div className="email-input">
          <label>Email address</label>
          <input
            type="email"
            value={formValues.email}
            name="email"
            id="email"
            onChange={handleChange}
            className="new-email"
          />
          {!!errors?.email.length && (
            <p className="error">Email {errors?.email[0]}</p>
          )}
        </div>

        <div className="first-name-input">
          <label>First name</label>
          <input
            type="text"
            value={formValues.firstname}
            name="firstname"
            id="firstname"
            onChange={handleChange}
            className="first-name"
          />
          {!!errors?.first_name.length && (
            <p className="error">First name {errors.first_name[0]}</p>
          )}
        </div>

        <div className="password-input">
          <label>Password</label>
          <input
            type="password"
            value={formValues.password}
            name="password"
            id="password"
            onChange={handleChange}
            className="new-password"
          />
          {!!errors?.password.length && (
            <p className="error">Password {errors.password[0]}</p>
          )}
        </div>

        <button type="submit" className="register-btn-form">
          Register
        </button>
      </form>
    </>
  );
}
