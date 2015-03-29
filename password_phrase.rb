class Phrases < CommonPasswords
  def phrase_long_enough?
    @password.length >= 25
  end

  def spaces?
    count = 0

    @password.split(//).each do |space|
      if[ " "].include?(space)
        count +=1
      end
    end
    if count >= 1
     return true
    end
    false
  end
end
