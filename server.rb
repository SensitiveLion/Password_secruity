require "sinatra"
require "pry"

get "/" do
  erb :page

end

post "/" do
  @password = PasswordSummary.new(params["password"])

  redirect "/"
end


