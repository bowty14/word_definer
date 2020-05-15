require 'rspec'
require 'Definition'
require 'Word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Lake", nil)
    @word.save()
  end
  
  describe('.all') do
  it('returns definitions of words') do
    define = Definition.new('body of water',@word_id, nil)
    define.save()
    define1 = Definition.new('a large spill',@word_id, nil)
    define1.save()
    expect(Definition.all).to(eq([define, define1]))
    end
  end

 describe('#save') do
    it("saves a words definition") do
      define = Definition.new('body of water', @word_id, nil)
      define.save()
      expect(Definition.all).to(eq([define]))
    end
  end

  describe('.clear') do
    it('clears all definitions') do
      define = Definition.new('body of water',@word_id, nil)
      define.save()
      define1 = Definition.new('a large spill',@word_id, nil)
      define1.save()
      expect(Definition.all).to(eq([]))
    end
  end
end