require "pry"

class PasswordSummary < Testing


  def initialize(password)
    @password = password
  end

  def password
    @password
  end

  def summary
    unless security?
      unless common_name?
        return "The password you had matched at least one of the 10,000 most common passwords"
      end

      unless ascii?
        return "Only use characters from your keyboard"
      end

      unless long_enough?
        return "Your password needs to be at least ten characters long"
      end

      unless enough_special_chars?
        return "You need to have at least two special characters (:,*,$...) or spaces in your password"
      end

      unless enough_uppercase?
        return "You need to have at least two uppercase characters in your password"
      end

      unless enough_lowercase?
        return "You need to have at least two lowercase characters in your password"
      end

      unless enough_numbers?
        return "You need to have at least two numbers in your password"
      end

      unless last_not_date?
        return "You can't use numbers  as the last two characters in your password"
      end

      unless first_not_capital?
        return "You can't use a capital letter as your first character"
      end
    end
    return "Good job. Your password is reasonably secure"
  end


end
