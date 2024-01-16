require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:new_square_calc)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @num = params["user_number"]
  @result = (@num.to_f) **2

  erb(:square_results)
end
  
get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @num = params["user_number"]
  @result = (@num.to_f) ** 0.5

  erb(:square_root_results)
end

get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @min = params["min_number"].to_f
  @max = params["max_number"].to_f
  @result = rand(@min..@max)

  erb(:random_results)
end
