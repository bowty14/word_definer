require ('pry')

class Word
  attr_reader :id, :name
  @@words = {}
  @@total_rows = 0

  def initialize(id, name)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end
  
end