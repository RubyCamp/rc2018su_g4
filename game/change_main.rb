require 'dxruby'
require_relative 'atari_player'

character = Player.new(300, 300)


Window.loop do
  if Input.key_push?(K_ESCAPE)
    character.change
  end
  character.draw
  
end
