class CreateComponentTable < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.integer :beverage_id
      t.integer :ingredient_id
     end
  end
end
