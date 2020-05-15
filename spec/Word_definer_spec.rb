require ('Word.rb')
require ('pry')
require ('rspec')

describe'#Word' do

  before(:each) do
    Word.clear()
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

  
  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end
  
  describe('.clear') do
    it('clears all words') do
      word = Word.new('coffee', nil)
      word.save()
      word1 = Word.new('sugar', nil)
      word1.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end


  describe('#==') do
  it('overrides the == operator so two words with same attr are consider similar') do
    word = Word.new('coffee', nil)
    word = Word.new('coffee', nil)
    expect(word).to(eq(word))
    end
  end

  describe('.find') do
    it('finds a word by id') do
      word = Word.new('coffee', nil)
      word.save()
      word1 = Word.new('sugar', nil)
      word1.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it('updates a word by id') do
      word = Word.new('coffee', nil)
      word.save()
      word.update("Starbucks")
      expect(word.name).to(eq("Starbucks"))
    end
  end

  describe('#delete') do
    it('deletes a word by id') do
      word = Word.new('coffee', nil)
      word.save()
      word1 = Word.new('sugar', nil)
      word1.save()
      word.delete()
      expect(Word.all).to(eq([word1]))
    end
  end

  describe('.search') do
    it('will allow a user to search for a word') do
      word = Word.new('coffee', nil)
      word.save()
      word1 = Word.new('sugar', nil)
      word1.save()
      expect(Word.search(word.name)).to(eq([word]))
    end
  end

end