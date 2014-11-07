class PublicationsAndHistory < ActiveRecord::Base
  belongs_to :history
  belongs_to :publication , foreign_key: "rlink"
  belongs_to :publication , foreign_key: "llink"
  belongs_to :publication , foreign_key: "publication_id"
end
