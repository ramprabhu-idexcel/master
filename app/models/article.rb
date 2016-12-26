#require 'elasticsearch/model'
class Article < ApplicationRecord
  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks
end

#Article.import force: true # for auto sync model with elastic search

=begin

=> reference

http://stackoverflow.com/questions/14278063/installing-elasticsearch-on-ubuntu-12-04
https://www.sitepoint.com/full-text-search-rails-elasticsearch/
https://github.com/elastic/elasticsearch-rails

=end