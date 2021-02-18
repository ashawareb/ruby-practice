class Adaptee
  def walk
    'walk_as_adaptee'
  end
end

class Adaptor
  attr_reader :adaptee

  def initialize
    @adaptee = Adaptee.new
  end

  def walk
    adaptee.walk + ' and_sing_song_as_adaptor'
  end
end

# Usage

adaptor = Adaptor.new
adaptor.walk
