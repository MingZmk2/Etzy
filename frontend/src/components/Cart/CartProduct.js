import { useDispatch, useSelector } from "react-redux";

function CartProduct({ product }) {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);
  const [count, setCount] = useState(product.quantity);
}

export default CartProduct;
