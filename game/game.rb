require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, publish_date, multiplayer, last_played_at)
    super(id, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end
end
