import { useState } from 'react';

const StarRating = () => {
  const [rating, setRating] = useState(0);

  const handleClick = (newRating) => {
    setRating(newRating);
  };

  return (
    <div>
      {[1, 2, 3, 4, 5].map((num) => (
        <span key={num} onClick={() => handleClick(num)}>
          {num <= rating ? (
            <i className="fa-solid fa-star"></i>
          ) : (
            <i className="fa-regular fa-star"></i>
          )}
        </span>
      ))}
    </div>
  );
};

export default StarRating;

