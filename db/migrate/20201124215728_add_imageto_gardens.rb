class AddImagetoGardens < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :image, :string
  end
end
