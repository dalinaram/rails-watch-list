class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie, uniqueness: { scope: :list, message: "Movie is already bookmarked in this list" }
  validates :comment, length: { minimum: 6, message: "Comment must have at least 6 characters" }
end
