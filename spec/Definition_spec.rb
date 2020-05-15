require 'rspec'
require 'Word.rb'
require 'Definition.rb'
require 'pry'

describe '#Definition' do
  
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Lake", nil)
    @word.save()
  end

  describe('#==')do
    it('it is the same definition if it has the same attributes as another') do
      define2 = Definition.new('a large spill',@word_id, nil)
      define1 = Definition.new('a large spill',@word_id, nil)
    expect(define2).to(eq(define1))
    end
  end

  
  describe('.all') do
  it('returns definitions of words') do
    define1 = Definition.new('body of water',@word_id, nil)
    define1.save()
    define2 = Definition.new('a large spill',@word_id, nil)
    define2.save()
    expect(Definition.all).to(eq([define1, define2]))
    end
  end

  
  describe('.clear') do
    it('clears all words') do
      definition1 = Definition.new('body of water',@word_id, nil)
      definition1.save()
      definition2 = Definition.new('a large spill',@word_id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

    describe('#save') do
       it("saves a words definition") do
         define = Definition.new('body of water', @word_id, nil)
         define.save()
         expect(Definition.all).to(eq([define]))
       end
     end

end