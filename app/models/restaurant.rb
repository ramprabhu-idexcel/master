class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
end

=begin

Restaurant.all
          .select("restaurants.*, AVG(reviews.rating) as avg_ratings")
          .joins(:reviews)
          .group("restaurants.id")
          .where("reviews.created_at > ?", 3.months.ago)
          .having("COUNT(reviews.id) > 10")
          .limit(10)
=end
