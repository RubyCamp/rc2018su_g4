require 'dxruby'

require_relative 'start'
require_relative 'controller'
require_relative 'controller1'
require_relative 'controller2'
require_relative 'controller3'
#require_relative 'controller4'
require_relative 'bullet'

Window.width = 690
Window.height = 690 

$winner_id = 0

$normal_music = Sound.new('bgm/battle_music_start.wav')
$normal_music.loop_count = -1
$normal_music.set_volume(255)

$one_one_music = Sound.new('bgm/battle_music_1on1.wav')
$one_one_music.loop_count = -1
$one_one_music.set_volume(0)

PLAYER_COLOR=[nil,"赤","青","緑","オレンジ"]
PLAYER_RGB = [nil, [255,132,132], [147,147,255], [191,255,127], [255,191,127] ]

def game_start
  $normal_music.play
  $one_one_music.play

  $winner_id = 0

  c1 = Controller1.new(20, 335, Image.load('image/player1.png'), 1, 0)
  c2 = Controller2.new(650, 335, Image.load('image/player2.png'), 2, 180)
  c3 = Controller3.new(335, 650, Image.load('image/player3.png'), 3, 270)
  #c4 = Controller4.new(300, 20, Image.load('image/player4.png'), 4, 90)

  loop_count = 181
  count_font = Font.new(50)
    
  Window.loop do
    loop_count -= 1

    Window.draw_font(335, 335, (loop_count / 60 + 1).to_s, count_font)

    c1.draw
    c2.draw
    c3.draw
    #c4.draw

    break if loop_count < 6
  end 

  $bullets = Array.new
  #controllers = [c1, c2, c3, c4]
  controllers = [c1, c2, c3]
  #death_flags = [false, false, false, false]
  death_flags = [false, false, false]

  def shot_bullet(controller)
    radian = controller.angle / 180.0 * Math::PI
      case controller.id
        when 1
            image = Image.load('image/player1_bullet.png')
        when 2
            image = Image.load('image/player2_bullet.png')
        when 3
            image = Image.load('image/player3_bullet.png')
        #when 4
            #image = Image.load('image/player4_bullet.png')
        else
            image = Image.new(10, 10, C_GREEN)
      end
    $bullets << Bullet.new(controller.x, controller.y, image, controller.id, radian)
  end 

  background = Image.load('image/window_bg.jpg')

  Window.loop do
    Window.draw(0, 0, background)

    c1.update if not c1.death
    c1.draw
    shot_bullet(c1) if Input.key_push?(K_LSHIFT) and not c1.death
    death_flags[0] = true if c1.death

    c2.update if not c2.death
    c2.draw
    shot_bullet(c2) if Input.key_push?(K_P) and not c2.death
    death_flags[1] = true if c2.death

    c3.update if not c3.death
    c3.draw
    shot_bullet(c3) if Input.key_push?(K_SPACE) and not c3.death
    death_flags[2] = true if c3.death
    
    #c4.update if not c4.death
    #c4.draw
    #shot_bullet(c4) if Input.mouse_push?(M_LBUTTON) and not c4.death
    #death_flags[3] = true if c4.death

    $bullets.each do |b|
      b.update
      b.draw
    end

    Sprite.check($bullets, controllers)

    $bullets.delete_if {|b| b.is_bound_limit }

    #if death_flags.count(true) >= 3
    if death_flags.count(true) >= 2
      $winner_id = 1 if not c1.death
      $winner_id = 2 if not c2.death
      $winner_id = 3 if not c3.death
      #$winner_id = 4 if not c4.death
      break
    end    

    if death_flags.count(false) == 2
        $normal_music.set_volume(0)
        $one_one_music.set_volume(255)
    end
  end #Window.loop
end

def end_screen
  return false if $winner_id == 0

  font = Font.new(40)
  is_restart = false

  Window.loop do
    Window.draw(0, 0, Image.load('./image/ending.png'))
    Window.draw_font(70, 150, "#{PLAYER_COLOR[$winner_id]}が宇宙を征服した！", font, hash = {color:PLAYER_RGB[$winner_id]})
    break if Input.key_push?(K_ESCAPE)
    if Input.key_push?(K_SPACE)
        is_restart = true
        break
    end
  end

  $normal_music.stop
  $one_one_music.stop
  return is_restart
end

while true
  break if not start_screen
  game_start
  puts $winner_id
  next if end_screen
  break
end
