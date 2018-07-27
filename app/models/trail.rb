class Trail < ApplicationRecord
  validates_presence_of :length, :name, :address

end
