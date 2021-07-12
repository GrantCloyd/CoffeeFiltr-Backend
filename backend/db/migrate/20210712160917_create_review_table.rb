class CreateReviewTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content  
      t.string :title
      t.float :rating
      t.integer :beverage_id
      t.integer :user_id
    end
  end
end
