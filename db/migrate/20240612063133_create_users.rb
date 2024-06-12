class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :grad_year
      t.string :state
      t.integer :interested_in, default: 0
      t.string :phone_number
      t.integer :parent_household_income
      t.string :club
      t.string :team
      t.string :ref_code
      t.integer :user_type, default: 0
      t.boolean :is_verified, default: false
      t.float :sub_start_date
      t.float :sub_end_date
      t.integer :got_details
      t.string :password_digest
      t.datetime :last_sign_in_at

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
