class Task < ApplicationRecord
  belongs_to :board
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :eyecatch
end
