class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :publications, :url, :text
  end
end
