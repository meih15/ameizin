# == Schema Information
#
# Table name: categories
#
#  id            :bigint           not null, primary key
#  category_name :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Category < ApplicationRecord

    has_many :products, 
        foreign_key: :category_id,
        class_name: :Product,
        dependent: :destroy

    validates :category_name, presence: true, uniqueness: true
end
