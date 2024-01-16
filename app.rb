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

get("/payment/new") do
  erb(:new_payment)
end

get("/payment/results") do
  @rate = ((params["APR"].to_f)/100)/12
  @loan_term = (params["years"].to_i) * 12
  @present_value = params["principal" ].to_f

  @numerator = @rate * @present_value
  @denominator = 1 - ((1 + @rate) ** (-1*@loan_term))

  @apr_display = params["APR"].to_f.to_fs(:percentage, {:precision => 4})
  @years_display = params["years"]
  @principal_display = params["principal" ].to_f.to_fs(:currency)
  @payment = (@numerator / @denominator).to_fs(:currency)

  erb(:payment_results)
end
