class CommonTests

  def ascii?
    @password.ascii_only?
  end

  def short?
    password.length < 10
  end

  def special_chars?
    count = 0
    @password.split(//).each do |letter|
      if ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+", "-", "=", "<", ">", '?', ":", "\"", "{", "}", "|", "\\", "]", "[", "'", ";", "/", ".", ",", "=", "-", "`", "~", " "].include?(letter)
        count +=1
      end
    end
    return count
  end

  def uppercase?
    matches = @password.gsub(/[^A-Z]*/,"")
    return matches.size
  end

  def lowercase?
    matches = @password.gsub(/[^a-z]*/,"")
    return matches.size
  end

  def numbers?
    matches = @password.gsub(/[^0-9]*/,"")
    return matches.size
  end

  def date?
    number = @password.split(//).last(2)
    if number.join.to_i >= 10
      return false
    end

    if number.first == "0" && ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].include?(number.last)
      return false
    end
    true
  end

end
