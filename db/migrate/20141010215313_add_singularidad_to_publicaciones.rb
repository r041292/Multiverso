class AddSingularidadToPublicaciones < ActiveRecord::Migration
  def self.up
    add_column :publicaciones, :singularidad, :boolean, :default => false
  end

  def self.down
    add_column :publicaciones, :singularidad
  end

end
