# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  product_name :string           not null
#  description  :text             not null
#  bullets      :text             default([]), is an Array
#  price        :float            not null
#  inventory    :integer          not null
#  category_id  :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Product < ApplicationRecord

    has_one :category,
        foreign_key: :category_id,
        class_name: :Category

    has_many :cart_items, 
        foreign_key: :product_id,
        class_name: :CartItem,
        dependent: :destroy

    has_many :order_history_items,
        foreign_key: :product_id,
        class_name: :OrderHistoryItem,
        dependent: :destroy

    has_many :reviews,
        foreign_key: :product_id, 
        class_name: :Review,
        dependent: :destroy

    has_one_attached :photo

    validates :product_name, :description, :price, :inventory, presence: true
    validates :product_name, uniqueness: true
    validate :bullet_is_array
    validates :price, numericality: { greater_than_or_equal_to: 0, format: { with: /\A\d+\.\d{2}\z/ } }
    validates :inventory, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    
    def bullet_is_array
        errors.add(:bullets, 'must be an array') unless bullets.is_a?(Array)
    end

end
