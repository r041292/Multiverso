class CreatePublicacions < ActiveRecord::Migration
  def change
    create_table :publicacions do |t|
      t.string :contenido
      t.string :url
      t.string :tipo
      t.integer :id_autor

      t.timestamps
    end
  end
end
