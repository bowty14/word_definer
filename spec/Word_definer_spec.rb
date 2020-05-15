require ('Word.rb')
require ('pry')
require ('rspec')

describe('#save') do
it('saves a word') do
  word = Word.new('coffee', nil)
  word.save()
  word1 = Word.new('sugar')
  word1.save()
  expect(Word.all).to(eq([word, word1]))

describe('.all') do
  it('returns an empty array when there are no words') do
   expect(Word.all).to(eq([]))
  end
end