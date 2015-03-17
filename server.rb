require "sinatra"
require "pry"

require_relative "common_tests"
require_relative "harder_tests"
require_relative "common_passwords"
require_relative "testing"
require_relative "password_summary"

use Rack::Session::Cookie

@check_password = nil

get "/" do
  erb :page
end

post "/" do
  @test = params["password"]
  @check_password = PasswordSummary.new(@test)
  session[:check] = @check_password

  redirect "/"
end


