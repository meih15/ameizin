# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    has_many :cart_items,
        foreign_key: :cart_id,
        class_name: :CartItem,
        dependent: :destroy
end
