class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :profile_photo
      t.datetime :date_of_birth
      t.string :city
      t.text :bio

      t.timestamps
    end
  end
end
