class CreateUserGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :user_gardens do |t|
      t.references :user, forign_key: true
      t.references :garden, forign_key: true
      t.timestamps
    end
  end
end
