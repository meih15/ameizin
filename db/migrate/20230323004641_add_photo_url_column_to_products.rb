class AddPhotoUrlColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :photourl, :string
  end
end
