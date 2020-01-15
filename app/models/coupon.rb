class Coupon < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :code
  validates_presence_of :percent_off
  belongs_to :merchant
  validates :percent_off, numericality: {greater_than: 0, less_than: 101}
  validates_uniqueness_of :code

end
