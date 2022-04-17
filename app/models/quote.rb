class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(created_at: :desc) }

  broadcasts_to ->(_) { 'quotes' }, inserts_by: :prepend
end
