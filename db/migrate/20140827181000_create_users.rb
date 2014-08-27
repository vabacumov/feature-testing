class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :required => true
      t.integer :age, :required => true
    end
  end
end
