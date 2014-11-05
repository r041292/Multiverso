class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :content
      t.string :url
      t.references :user_id, index: true
      t.integer :type
      t.boolean :singularity

      t.timestamps
    end
  end
end
