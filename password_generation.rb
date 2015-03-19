class Generate < PasswordSummary

  def self.random_symbol
    symbol =["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+",
             "-", "=", "<", ">", '?', ":", "\"", "{", "}", "|", "\\", "]",
             "[", "'", ";", "/", ".", ",", "=", "-", "`", "~", " "].sample

    return symbol
  end

  def self.random_lowercase
     lower = ('a'..'z').to_a[rand(26)]

     return lower
  end

  def self.random_uppercase
     upper = ('a'..'z').to_a[rand(26)]

     return upper
  end

  def self.random_number
    number = rand(10)

    return number
  end

  def self.random_string(num)
    random = []

    random << Generate.random_symbol
    random << Generate.random_lowercase
    random << Generate.random_uppercase
    random << Generate.random_number

    num.times do
      rand = rand(4)
      if rand == 0
        random << random_symbol
      end
      if rand == 1
        random << random_lowercase
      end
      if rand == 2
        random << random_uppercase
      end
      if rand == 3
        random << random_number
      end
    end

    random.shuffle

    return random.join
  end

  def self.secure
    maybe_good = Generate.random_string(20)
    random_pass = PasswordSummary.new(maybe_good)
    unless random_pass.security?
      maybe_good = Generate.random_string(20)
    end
    return maybe_good
  end
end
