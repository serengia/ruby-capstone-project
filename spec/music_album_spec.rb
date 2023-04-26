require_relative '../music/music_album'

describe 'MusicAlbum' do
  before :each do
    @album1 = MusicAlbum.new(true)
  end

  describe 'class' do
    it 'should return value in music_album class' do
      expect(@album1.on_spotify).to be_truthy
    end
  end

  describe 'instace' do
    it 'sould be instance of class' do
      expect(@album1).to be_instance_of MusicAlbum
    end
  end
end
