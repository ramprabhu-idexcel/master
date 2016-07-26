class MoneyType < ActiveRecord::Type::Integer
  def cast(value)
    if !value.kind_of?(Numeric) && value.include?('$')
      price_in_dollars = value.gsub(/\$/, '').to_f
      super(price_in_dollars * 100)
    else
      super
    end
  end
end