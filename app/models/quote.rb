class Quote < ApplicationRecord
  has_many :item_dates, dependent: :destroy
  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(created_at: :desc) }
  broadcasts_to ->(quote) { [quote.company, 'quotes'] }, inserts_by: :prepend
end
