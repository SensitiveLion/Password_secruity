require "sinatra"
require "pry"

require_relative "common_tests"
require_relative "harder_tests"
require_relative "common_passwords"
require_relative "password_phrase"
require_relative "testing"
require_relative "password_summary"
require_relative "password_generation"
require_relative "phrase_testing"
require_relative "summary_phrase"

use Rack::Session::Cookie, :secret => 'change_me',
                           :expire_after => 600

@random = nil
@check_password = nil
@check_phrase = nil

get "/" do
  erb :page
end

post "/password" do
  @test = params["password"]
  @check_password = PasswordSummary.new(@test)
  session[:check] = @check_password
  redirect "/"
end

post '/passphrase' do
  @test = params["passphrase"]
  @check_phrase = PhraseSummary.new(@test)
  session[:check_phrase] = @check_phrase
  redirect "/"
end

post "/generate" do
  @random = Generate.secure
  session[:generate] = @random
  redirect "/"
end

post "/reset" do
  @random = nil
  @check_password = nil
  @check_phrase = nil
  session[:generate] = @random
  session[:check] = @check_password
  session[:check_phrase] = @check_phrase

  redirect "/"
end

