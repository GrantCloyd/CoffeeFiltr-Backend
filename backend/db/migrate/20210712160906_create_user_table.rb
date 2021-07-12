

class CreateUserTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    t.string :first_name
    t.string :last_name 
    t.string :email
    t.string :username
    t.text :bio 
    t.string :avatar
    t.string :password
    t.timestamps  
    end
  end
end
