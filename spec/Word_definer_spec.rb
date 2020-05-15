require ('Word.rb')
require ('pry')
require ('rspec')


describe('.all') do
  it('returns an empty array when there are no words') do
    expect(Word.all).to(eq([]))
  end
end

describe('#save') do
it('saves a word') do
  word = Word.new('coffee', nil)
  word.save()
  word1 = Word.new('sugar', nil)
  word1.save()
  expect(Word.all).to(eq([word, word1]))
  end
end

describe('#==') do
it('overrides the == operator so two words with same attr are consider similar') do
  word = Word.new('coffee', nil)
  word = Word.new('sugar', nil)
  expect(word).to(eq(word1))
  end
end