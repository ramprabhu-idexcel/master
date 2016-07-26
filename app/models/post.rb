class Post < ApplicationRecord
  attribute :quantity, :integer
  attribute :my_string, :string, default: "new default"
  attribute :my_default_proc, :datetime, default: -> { Time.now }
  attribute :price_in_cents, :money
  attribute :items_list, :array
  has_many :comments, dependent: :destroy
  validates :title, presence: true
end
