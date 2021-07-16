class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: ['not-started', 'in-progress', 'complete'] }
  validates :deadline, presence: true

  STATUS_OPTIONS = [
    ['Not started', 'not-started'],
    ['In progress', 'in-progress'],
    ['Complete', 'complete']
  ]
end
