require('sinatra') 
require('sinatra/reloader') 
require('./lib/Word.rb')
also_reload('lib/**/*.rb') 

# routes for Word

get('/') do
  @words = Word.all 
  erb(:homepage)
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

get('/homepage/:id/definition/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post('/homepage/:id/definition') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition_name],@word.id,nil)
  definition.save()
  erb(:word)
end

patch('/homepage/:id/definiton/:definition_id') do
 @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end

delete('/homepage/:id/definition/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete()
  @word = Word.find(params[:id].to_i())
  erb(:word)
end