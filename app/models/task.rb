class Task < ApplicationRecord
  belongs_to :category

  enum status: [:incomplete, :complete]

  validates :title, presence: true
end
