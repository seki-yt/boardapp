class Task < ApplicationRecord
  belongs_to :board
  belongs_to :user

  has_one_attached :eyecatch
end
