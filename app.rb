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