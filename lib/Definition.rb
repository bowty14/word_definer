class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@definitions
  @@total_rows += 1

  def initialize(name, word_id, id)
    @name = name
    @word_id = word_id
    @id = id || @@total_rows += 1
  end
end