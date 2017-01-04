class DateTime
  def weekday?
    !sunday? && !saturday?
  end
end