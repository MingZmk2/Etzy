import { useState } from "react";
import { useDispatch } from "react-redux";
import { createUser } from "../../store/userReducer";

export default function SignupForm({ onSuccess }) {
  const dispatch = useDispatch();
  const [formValues, setFormValues] = useState({
    email: "",
    firstname: "",
    password: "",
  });
  // const [password, setPassword] = useState("");
  // const [repeatPassword, setRepeatPassword] = useState("");
  // const user = useSelector((state) => state.session.user);
  // const [isSubmitted, setIsSubmitted] = useState(false);

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
    dispatch(createUser(user));
    onSuccess();
  };

  return (
    <>
      <h2>Create Your account</h2>
      <h3>Registration is easy</h3>
      <form onSubmit={handleSubmit}>
        <label>
          Email address
          <input
            type="email"
            value={formValues.email}
            name="email"
            id="email"
            onChange={handleChange}
          />
        </label>

        <label>
          First name
          <input
            type="text"
            value={formValues.firstname}
            name="firstname"
            id="firstname"
            onChange={handleChange}
          />
        </label>

        <label>
          Password
          <input
            type="password"
            value={formValues.password}
            name="password"
            id="password"
            onChange={handleChange}
          />
        </label>

        <button type="submit">Register</button>
      </form>
    </>
  );
}
