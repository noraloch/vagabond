class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :place_id
      t.string :photo
      t.text :review
      t.string :title

      t.timestamps
    end
  end
end
