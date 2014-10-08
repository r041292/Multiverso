class CreateHistoria < ActiveRecord::Migration
  def change
    create_table :historia do |t|
      t.integer :id_singularidad

      t.timestamps
    end
  end
end
