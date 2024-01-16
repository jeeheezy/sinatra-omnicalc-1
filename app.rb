require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:new_square_calc)
end

get("/square/new") do
  erb(:new_square_calc)
end

get '/square/results' do
  @num = params["user_number"]
  @result = (@num.to_f) **2

  erb(:square_results)
end
