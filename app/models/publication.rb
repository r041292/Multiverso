class Publication < ActiveRecord::Base
  belongs_to :user
  has_many :histories, foreign_key: "publication_id"
  has_many :publications_and_histories
  self.inheritance_column = nil
end
