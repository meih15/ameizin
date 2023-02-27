# == Schema Information
#
# Table name: order_history_items
#
#  id                 :bigint           not null, primary key
#  user_id            :bigint           not null
#  product_id         :bigint           not null
#  quantity           :integer          default(1), not null
#  order_confirmation :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  item_total         :float            not null
#  order_total        :float            not null
#
class OrderHistoryItem < ApplicationRecord

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :user

    belongs_to :product,
        foreign_key: :product_id,
        class_name: :Product

    validates :quantity, :order_confirmation, :order_total, :item_total, presence: true
    validates :quantity, numericality: { greater_than: 0 }

end
