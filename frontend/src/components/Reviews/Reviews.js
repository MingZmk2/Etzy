import * as React from "react";
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { getProduct } from "../../store/product";
import {
  findReviews,
  updateReview,
  createReview,
} from "../../store/reviews.js";
import ReviewList from "./ReviewList";
import { FormsModal } from "../FormsModal";
import Box from "@mui/material/Box";
import Rating from "@mui/material/Rating";
import "./Reviews.css";

const ReviewShow = () => {
  const dispatch = useDispatch();
  const { productId } = useParams();
  const product = useSelector(getProduct(productId));
  if (!product.reviews) {
    product.reviews = {};
  }
  const sessionUser = useSelector((state) => state.session.user);
  const reviews = useSelector((state) => state.reviews);
  const [comment, setComment] = useState("");
  const [rating, setRating] = useState(0);
  const [allowEdit, setAllowEdit] = useState(false);
  const [review, setReview] = useState("");
  const [notice, setNotice] = useState(false);
  const [errMessage, setErrMessage] = useState("");
  const review_arr = Object.values(reviews);

  let submitButton;
  if (sessionUser) {
    submitButton = (
      <input id="submit-review" type="submit" value="Submit review" />
    );
  } else {
    let message = {
      text: "Submit review",
      type: "submit-review-button",
    };
    submitButton = <FormsModal message={message} />;
  }
  useEffect(() => {
    const review_arr = Object.values(reviews);
    dispatch(findReviews(product.reviews));
    if (sessionUser) {
      if (review_arr.some((review) => review.reviewerId === sessionUser.id)) {
        setNotice(true);
      }
    } else {
      setNotice(false);
    }
  }, [productId, product.reviews, sessionUser]);

  const handleSubmit = (e) => {
    e.preventDefault();

    if (comment === "") {
      return setErrMessage("Please leave a comment");
    } else if (rating === 0) {
      return setErrMessage("Please rate the product");
    }
    if (allowEdit && rating !== 0) {
      let reviewToEdit = {
        id: review.id,
        comment: comment,
        rating: rating,
        productId: productId,
        reviewerId: sessionUser.id,
      };
      dispatch(updateReview(reviewToEdit));
      setAllowEdit(false);
      setComment("");
      setRating("");
      setNotice(true);
    } else {
      if (review_arr.some((review) => review.reviewerId === sessionUser.id)) {
        setNotice(true);
      } else {
        let reviewToSubmit = {
          comment: comment,
          rating: rating,
          productId: productId,
          reviewerId: sessionUser.id,
        };
        dispatch(createReview(reviewToSubmit));
        setComment("");
        setRating("");
        setNotice(true);
      }
    }
  };
  const handleEdit = (e) => {
    setComment(e.comment);
    setRating(e.rating);
    setAllowEdit(true);
    setNotice(false);
    setReview(e);
  };

  const reviewList = Object.values(reviews).map((review) => (
    <ReviewList
      key={review.id}
      review={review}
      handleEdit={handleEdit}
      setNotice={setNotice}
    />
  ));
  if (product) {
    return (
      <>
        <div className="reviews-wrapper">
          <div className="reviews">
            <div className="review-header">
              <h1>{reviews.length} Reviews</h1>
            </div>
            <div className="product-reviews">
              <p>Reviews for this item</p>
              <ul>{reviewList}</ul>
            </div>
          </div>
        </div>

        {!notice && (
          <div>
            <div id="review-error">{errMessage}</div>
            <form onSubmit={handleSubmit} className="review-form">
              <div>
                <textarea
                  cols="60"
                  rows="10"
                  value={comment}
                  onChange={(e) => setComment(e.target.value)}
                  placeholder="Type comment here"
                  id="review-text"
                ></textarea>
                <br />
              </div>
              <div className="review-right">
                <h3>Rate the product:</h3>
                {/* <br/> */}
                <Box
                  sx={{
                    "& > legend": { mt: 2 },
                  }}
                >
                  <Rating
                    name="size-medium"
                    value={rating}
                    onChange={(event, newValue) => {
                      setRating(newValue);
                    }}
                  />
                </Box>
                <div className="submit-button-container">{submitButton}</div>
              </div>
            </form>
            <div className="review-policy">
              Due to shipping carrier delays resulting from weather or other
              issues, some orders are arriving late no matter how quickly
              sellers ship out your package. By submitting, you agree to Etzy's
              customer review policy
            </div>
          </div>
        )}
        {notice && (
          <>
            <hr />
            <div className="review-notice">
              You have already left comment for this product
            </div>
          </>
        )}
      </>
    );
  }
};

export default ReviewShow;
