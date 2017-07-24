require "sinatra"

get '/' do
	redirect '/get_sandwich'
end

get '/get_sandwich' do
	erb :sandwich
end

post '/sandwich_choice' do
	sandwich = params[:sandwich]
	redirect '/side?sandwich=' + sandwich
end

get '/side' do
	sandwich = params[:sandwich]
	erb :fries, :locals => {:sandwich => sandwich}
end

post '/fries_choice' do
	sandwich = params[:sandwich]
	fries = params[:yes]
	no_fries = params[:no]
	if params[:yes] = 'yes'
		side = "fries"
		redirect '/shake?sandwich=' + sandwich + '&side=' + side
	else
		erb :side, :locals => {:sandwich => sandwich}
	end
end

post '/side_choice' do
	sandwich = params[:sandwich]
	side = params[:side]
	redirect '/shake?sandwich=' + sandwich + '&side=' + side
end

get '/shake' do
	sandwich = params[:sandwich]
	side = params[:side]
	erb :shake, :locals => {:sandwich => sandwich, :side => side}
end

post '/shake_choice' do
	sandwich = params[:sandwich]
	side = params[:side]
	shake = params[:shake]
	redirect '/order?sandwich=' + sandwich + '&side=' + side + '&shake=' + shake
end

get '/order' do
	sandwich = params[:sandwich]
	side = params[:side]
	shake = params[:shake]
	erb :order, :locals => {:sandwich => sandwich, :side => side, :shake => shake}
end