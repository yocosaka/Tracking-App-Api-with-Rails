class Item < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, through: :records
  validates_presence_of :title, :unit
end
