class Discussion < ApplicationRecord
  has_many :comments
  belongs_to :category
  belongs_to :member
end
