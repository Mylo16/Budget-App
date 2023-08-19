class Entity < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :group

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true

  validate :author_belongs_to_user

  private

  def author_belongs_to_user
    return if user_id == author_id

    errors.add(:author_id, 'must belong to the same user')
  end
end
