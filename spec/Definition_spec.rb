require 'rspec'
require 'Definition.rb'
require 'Word.rb'
require 'pry'

describe '#Definition' do
  
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
    it('save a words definition') do
    define = Definition.new('body of water',@word_id, nil)
    define.save()
     expect(Definition.all).to(eq([define]))
    end
  end
end