require 'rspec'
require 'Definition'
require 'Word'
require 'pry'

describe '#Definition' do
  
  describe('.all') do
  it('returns definitions of words') do
    define = Definition.new('body of water',@word.id, nil)
    define.save()
    define1 = Definition.new('a large spill',@word.id, nil)
    define1.save()
    expect(Definition.all).to(eq([define, define1]))
    end
  end
end