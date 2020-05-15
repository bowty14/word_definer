require('sinatra') 
require('sinatra/reloader') 
require('./lib/Word.rb')
also_reload('lib/**/*.rb') 