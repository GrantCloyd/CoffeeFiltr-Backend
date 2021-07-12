class CreateBeverageTable < ActiveRecord::Migration[5.2]
  def change
    create_table :beverages do |t|
      t.string :title
      t.text :description
      t.string :img_url
      t.boolean :hot, default: true
    end
  end
end
