class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, presence: true, length: { minimum: 6 }
  validates :list, presence: true, uniqueness: true
  validates :movie, presence: true, uniqueness: true
  validates :movie_id, uniqueness: { scope: [:list_id] }
end
