class CreateAdminGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.integer :products_counter, :default=>0
      t.integer :position, :limit=>3 #on list,
      t.integer :parent_id
      t.timestamps
    end
    add_index(:groups, :position)
  end

  def self.down
    drop_table :groups
  end
end
