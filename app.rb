require('sinatra') 
require('sinatra/reloader') 
require('./lib/Word.rb')
also_reload('lib/**/*.rb') 

# routes for Word

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

get('/homepage/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/homepage/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/homepage/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  redirect to('/homepage')
end

delete('/homepage/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/homepage')
end

# routes for Definition
