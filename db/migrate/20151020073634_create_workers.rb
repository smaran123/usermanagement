class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
       t.string :name
      t.string :phone_no
      t.string  :provider
      t.string  :uid 
      t.datetime :oauth_expires_at
      t.timestamps null: false
    end
  end
end
