

class CreateUserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    t.string :name 
    t.string :username
    t.text :bio 
    t.string :avatar
    t.string :password  
    end
  end
end
