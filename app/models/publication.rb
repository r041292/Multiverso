class Publication < ActiveRecord::Base
  belongs_to :users
  has_many :histories
  has_many :publications_and_histories
  self.inheritance_column = nil
end
