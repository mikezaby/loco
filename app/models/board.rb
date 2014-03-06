class Board < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }

  has_many :lists
end
