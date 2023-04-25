require_relative '../item.rb'

class Game < Item
    attr_accessor :multiplayer, :last_played_at

    def initialize(multiplayer, last_played_at, *info)
        super(*info)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?
        super && (Time.now.year - @last_played_at.year) > 2
    end
end