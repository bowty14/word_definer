require('sinatra') 
require('sinatra/reloader') 
require('./lib/Word.rb')
also_reload('lib/**/*.rb') 

get('/') do
  @words = Word.all 
  erb(:words)
end

get('/homepage') do
  if (params[:search])
    @words = Word.search(params[:search])
  elsif params[:sort]
    @words = Word.sort
  else
    @words = Word.all
  end
  erb(:homepage)
end

post('/homepage') do
  name = params[:word_name]
  word = Word.new(name, nil)
  word.save
  redirect to('/homepage')
end

get('/homepage/search') do
  @search_result = Word.search(params[:search])
  erb(:search_results)
end

get('/homepage/new') do
  erb(:new_word)
end