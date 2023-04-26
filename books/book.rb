require_relative '../item'

class Book < Item
  attr_reader :id
  attr_accessor :publisher, :cover_state

  def initialize(id, publish_date, publisher, cover_state)
    super(id, publish_date)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == true
  end
  private :can_be_archived?
end
