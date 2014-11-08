class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :content
      t.text :url
      t.references :user, index: true
      t.integer :type
      t.boolean :singularity

      t.timestamps
    end
  end
end
