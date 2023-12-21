class Quote < ApplicationRecord
  default_scope { order(created_at: :desc) }

  validates :name, presence: true

  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
end
