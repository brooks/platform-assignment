class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name, default: ''
    	t.string :line1, default: ''
    	t.string :line2, default: ''
    	t.string :city, default: ''
    	t.string :state, default: ''
    	t.string :zip, default: ''
    	t.string :phone, default: ''
      t.timestamps null: true
    end
  end
end
