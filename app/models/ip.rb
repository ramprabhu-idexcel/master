class Ip < ApplicationRecord
  validates :ipaddress, presence: true, uniqueness: true
end
