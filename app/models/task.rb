class Task < ApplicationRecord
  belongs_to :user

  enum status: [:incomplete, :complete]

  validates :title, presence: true
  validates :category, presence: true, length: { minimum: 4 }
end
