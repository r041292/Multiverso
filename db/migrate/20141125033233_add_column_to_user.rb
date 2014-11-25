class AddColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :blocked, :boolean, :default => false
  end

   def self.down
  	remove_colum :users, :blocked
  end
end
