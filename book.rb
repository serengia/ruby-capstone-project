require_relative 'label'

class Book
    attr_reader :id
    attr_accessor :publisher, :cover_state

    def initialize(publisher, cover_state)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    
  end
end