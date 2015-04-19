class PhraseSummary < PhraseTesting

  def initialize(password)
    @password = password
  end

  def password
    @password
  end

  def summary
    if phrase_security? == false
      unless phrase_long_enough?
        return "Your passphrase needs to be at least 20 characters long"
      end

      unless spaces?
        return "You need to have at one space"
      end

      unless uppercase?
        return "You need to have a uppercase character in your password"
      end

      unless lowercase?
        return "You need to have a lowercase character in your password"
      end
    end
    return "Good job. Your password is reasonably secure"
  end
end
