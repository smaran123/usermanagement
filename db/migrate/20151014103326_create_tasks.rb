class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      
      t.string :name
      t.text :description
      t.datetime :time_required
      t.string :status 
      t.integer :user_id
      t.date :completion_date
      t.string :assign_to
      t.integer :admin_id 
           
      t.timestamps null: false
    end
  end
end


