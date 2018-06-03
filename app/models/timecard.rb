class Timecard < ApplicationRecord
  has_many :timecard_detail
  accepts_nested_attributes_for :timecard_detail, allow_destroy: true
end
