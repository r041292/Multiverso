class History < ActiveRecord::Base
  belongs_to :publication, foreign_key: "publication_id"
  has_many :publications_and_histories
end
