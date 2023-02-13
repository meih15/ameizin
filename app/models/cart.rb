# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  user_id    :bigint           not null
#  quantity   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord

    validates :product_id, :user_id, :quantity, presence: true

    belongs_to :user, optional: true
        foreign_key: :user_id,
        class_name: :User

    has_and_belongs_to_many :products

end
