class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :group_id
      t.string :name
      t.float  :price
      t.text   :description
      t.integer :position, :limit=>3 #positon in group
      t.timestamps
    end
    add_index(:products, :group_id)
    add_index(:products, :name)
    add_index(:products, :price)
  end

  def self.down
    drop_table :products
  end
end
