# app/models/restaurant.rb
class Restaurant < ApplicationRecord
  validates :name, :address, presence: true
  validates :category, inclusion: { in: %w[french italian chinese japanese belgian] }
  has_many :reviews, dependent: :destroy
end
