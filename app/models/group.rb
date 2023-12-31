class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, dependent: :delete_all

  validates :name, presence: true
  validates :icon, presence: true
end
