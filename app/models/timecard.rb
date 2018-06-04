class Timecard < ApplicationRecord
  has_many :timecard_detail
  has_many :expences
  accepts_nested_attributes_for :timecard_detail, allow_destroy: true
  accepts_nested_attributes_for :expences, allow_destroy: true
end
