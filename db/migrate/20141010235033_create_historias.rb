class CreateHistorias < ActiveRecord::Migration
  def change
    create_table :historias do |t|
      t.integer :id_singularidad

      t.timestamps
    end
  end
end
