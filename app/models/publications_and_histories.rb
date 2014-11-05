class PublicationsAndHistories < ActiveRecord::Base
  belongs_to :history_id
  belongs_to :rlink
  belongs_to :llink
  belongs_to :publication_id
end
