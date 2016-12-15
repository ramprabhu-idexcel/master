class Person < ApplicationRecord
  belongs_to :parent, class_name: Person
  has_many :children, class_name: Person, foreign_key: :parent_id
  has_many :grandchildren, class_name: Person, through: :children, source: :children
end

=begin

 => For children

john = Person.create(name: "John")

jim = Person.create(name: "Jim", parent: john)

bob = Person.create(name: "Bob", parent: john)

john.children.map(&:name) =>  ["Jim", "Bob"]


=> For Grand Children

sally = Person.create(name: "Sally")

sue = Person.create(name: "Sue", parent: sally)

kate = Person.create(name: "Kate", parent: sally)

lisa = Person.create(name: "Lisa", parent: sue)

robin = Person.create(name: "Robin", parent: kate)

donna = Person.create(name: "Donna", parent: kate)

sally.grandchildren.map(&:name)  =>  ["Lisa", "Robin", "Donna"]

=end
