class CreateLikeTable < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :review_id
     end
  end
end
