# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  product_id :bigint           not null
#  rating     :integer          not null
#  headline   :string           not null
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Review < ApplicationRecord
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :product,
        foreign_key: :product_id,
        class_name: :Product

    validates :rating, :headline, presence: true
    validate :rating_cannot_be_zero

    private
    
    def rating_cannot_be_zero
        errors.add(:rating, "must be greater than 0") if rating && rating <= 0
    end

end
