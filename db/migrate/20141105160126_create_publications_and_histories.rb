class CreatePublicationsAndHistories < ActiveRecord::Migration
  def change
    create_table :publications_and_histories do |t|
      t.references :history_id, index: true
      t.references :rlink, index: true
      t.references :llink, index: true
      t.references :publication_id, index: true

      t.timestamps
    end
  end
end
