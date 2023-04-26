require_relative '../game/game'
describe Game do
  describe '#can_be_archived?' do
    context 'when published over 10 years ago and last played over 2 years ' do
      game = Game.new(nil, Time.new(2005, 1, 1), true, Time.new(2010, 1, 1))
      it 'should return true' do
        expect(game.can_be_archived?).to be_truthy
      end
    end

    context 'when published over 10 years ago and last played less than 2 years ' do
      game = Game.new(nil, Time.new(2005, 1, 1),true, Time.now)
      it 'should return true' do
        expect(game.can_be_archived?).to be_falsey
      end
    end

    context 'when published less than 10 years ago and last played over 2 years ' do
      game = Game.new(nil, Time.now, true, Time.new(2020, 1, 1))
      it 'should return true' do
        expect(game.can_be_archived?).to be_falsey
      end
    end
  end
end
