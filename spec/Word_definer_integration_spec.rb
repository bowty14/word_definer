require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application 
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/homepage')
    click_on('Add a new word.')
    fill_in('word_name', :with => 'Lake')
    click_on('Go!')
    expect(page).to have_content('Lake')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition and then goes to the definition page') do
    word = Word.new( @name = "Lake", @id = nil)
    word.save()
    visit("/homepage/#{word.id}")
    fill_in('definition_name', :with => 'A small body of water')
    click_on('Add definition')
    expect(page).to have_content('A small body of water')
  end
end

describe('update a word', {:type => :feature}) do
  it('updates a word then goes to the word page') do
    word = Word.new( @name = "Lake", @id = nil)
    word.save()
    visit("/homepage/#{word.id}")
    click_on('Edit word')
    fill_in('name', :with => 'Ocean')
    click_on('Update')
    expect(page).to have_content('Ocean')
  end
end
