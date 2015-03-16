class Testing < CommonPasswords

  def enough_special_chars?
    special_chars >= 2
  end

  def enough_uppercase?
    uppercase >= 2
  end

  def enough_lowercase?
    lowercase >= 2
  end

  def enough_numbers?
    numbers >= 2
  end

  def security?
    common_name? &&
    ascii? &&
    long_enough?  &&
    enough_special_chars? &&
    enough_uppercase? &&
    enough_lowercase? &&
    enough_numbers? &&
    last_not_date? &&
    first_not_capital?
  end
end
