class Concert < ApplicationRecord
  belongs_to :group
  has_many :pieces
end
