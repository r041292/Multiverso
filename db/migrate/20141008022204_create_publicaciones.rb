class CreatePublicaciones < ActiveRecord::Migration
  def change
    create_table :publicaciones do |t|
      t.string :texto
      t.string :url
      t.string :tipo
      t.integer :id_autor

      t.timestamps
    end
  end
end
