class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :password_digest
      t.string :companyName
      t.string :specialties

      t.timestamps null: false
    end
  end
end
