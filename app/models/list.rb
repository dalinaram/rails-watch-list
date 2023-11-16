class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy #garantit que la suppression d'une liste entraîne également la suppression de tous les bookmarks associés à cette liste.
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
end
