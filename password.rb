require "pry"

require_relative "common_tests"
require_relative "harder_tests"
require_relative "common_passwords"
require_relative "password_test"

puts <<-summary

Check if your password is secure.

Your password should:

- include at least 2 numbers, uppercase letters,
  lowercase letters, and specail characters

- Not be one of the most commenly used commonly used

- Not have numbers as the last two digits

    summary
def get_password
  password = gets.chomp
end



evaluate = PasswordTest.new(get_password)
binding.pry
puts evaluate.summary



while evaluate.security? == false
  evaluate = PasswordTest.new(get_password)
  puts evaluate.summary
end
