class CreatePublicacionHistoria < ActiveRecord::Migration
  def change
    create_table :publicacion_historia do |t|
      t.integer :id_historia
      t.integer :id_publicacion
      t.integer :l_link
      t.integer :r_link

      t.timestamps
    end
  end
end
