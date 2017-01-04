class Module
  def delegate(method, to:)
    define_method(method) do |*args, &block|
      send(to).send(method, *args, &block)
    end
  end
end

class Receptionist
  def phone(name)
    puts "Hello #{name}, I've answered your call"
  end
end

class Company
  attr_reader :receptionist
  delegate :phone, to: :receptionist

  def initialize
    @receptionist = Receptionist.new
  end
end

company = Company.new
company.phone("Ram")