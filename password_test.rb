require "pry"

class PasswordTest < CommonPasswords


  def initialize(password)
    @password = password
  end

  def password
    @password
  end

  def security?
    if common_name?
      if ascii?
        if short? == false
          if special_chars? >= 2
            if uppercase? >= 2
              if lowercase? >= 2
                if numbers? >= 2
                  if date?
                    return true
                  end
                end
              end
            end
          end
        end
      end
    end
    false
  end

  def summary
    unless security?
      if common_name? == false
        return "The password you had matched at least one of the 10,000 most common passwords"
      end

      if ascii? == false
        return "Only use characters from your keyboard"
      end

      if short?
        return "Your password needs to be at least ten characters long"
      end

      if special_chars? < 2
        return "You need to have at least two special characters (:,*,$...) or spaces in your password"
      end

      if uppercase? < 2
        return "You need to have at least two uppercase characters in your password"
      end

      if lowercase? < 2
        return "You need to have at least two lowercase characters in your password"
      end

      if numbers? < 2
        return "You need to have at least two numbers in your password"
      end

      if date? == false
        return "You can't use numbers  as the last two characters in your password"
      end
    end
    return "Good job. Your password is reasonably secure"
  end


end
