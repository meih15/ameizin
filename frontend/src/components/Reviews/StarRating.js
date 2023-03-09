import './StarRating.css'

const StarRating = ({rating, setRating}) => {

  const handleClick = (newRating) => {
    setRating(newRating);
  };

  return (
    <div>
      {[1, 2, 3, 4, 5].map((num) => (
        <span key={num} onClick={() => handleClick(num)}>
          {num <= rating ? (
            <i id='edit-filled-star-single-review' className="fa-solid fa-star"></i>
          ) : (
            <i id='edit-empty-star-single-review' className="fa-regular fa-star"></i>
          )}
        </span>
      ))}
    </div>
  );
};

export default StarRating;

