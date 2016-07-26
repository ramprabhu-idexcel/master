class ArrType < ActiveRecord::Type::Integer
  def cast(value)
    if value.is_a?(Array)
      value
    else
      super
    end
  end
end