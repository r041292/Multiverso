class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :publication_id, index: true

      t.timestamps
    end
  end
end
