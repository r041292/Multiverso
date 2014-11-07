class History < ActiveRecord::Base
  belongs_to :publication
  has_many :publications_and_histories
end
