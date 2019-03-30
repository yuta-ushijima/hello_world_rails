class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.string :postal_code
      t.string :address
      t.datetime :birthday
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
