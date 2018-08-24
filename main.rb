require 'dxruby'

require_relative 'start'
require_relative 'guide'
require_relative 'controller'
require_relative 'controller1'
require_relative 'controller2'
require_relative 'controller3'
require_relative 'controller4'
require_relative 'bullet'

Window.x = 300
Window.y = 20
Window.width = 690
Window.height = 690 

$winner_id = 0

$music_changed = false

$normal_music = Sound.new('bgm/battle_music_start.wav')
$normal_music.loop_count = -1

$one_one_music = Sound.new('bgm/battle_music_1on1.wav')
$one_one_music.loop_count = -1

$bullets = Array.new
$finalists = [999, 999]
$death_flags = [false, false, false, false]

$bullets = Array.new
$controllers = Array.new

$font32 = Font.new(32)

PLAYER_COLOR=[nil,"赤","青","緑","オレンジ"]
PLAYER_RGB = [nil, [255,132,132], [147,147,255], [191,255,127], [255,191,127] ]

def pickup_finalists(controllers)
  index = 0
  controllers.each do |c|
    #finallists[index] = c.id if not c.death
  end
end

def is_bullet_limit(controller)
  exist_bullets = $bullets.select {|bullet| controller.id == bullet.source_id }
  if exist_bullets.size > 5
    return true
  else
    return false
  end
end

def get_rest_bullets(controller)
  exist_bullets = $bullets.select {|bullet| controller.id == bullet.source_id }
  return 6 - exist_bullets.size
end

def shot_bullet(controller)
  radian = controller.angle / 180.0 * Math::PI
  case controller.id
    when 1
      image = Image.load('image/player1_bullet.png')
    when 2
      image = Image.load('image/player2_bullet.png')
    when 3
      image = Image.load('image/player3_bullet.png')
    when 4
      image = Image.load('image/player4_bullet.png')
    else
      image = Image.new(10, 10, C_GREEN)
  end
  $bullets << Bullet.new(controller.x, controller.y, image, controller.id, radian)
end

def update_controller(controller)
  case controller.id
    when 1
      is_shot = Input.key_push?(K_LSHIFT)
      color = [255, 255, 100, 100]
      angle = 90
      font_x, font_y = 80, 100
    when 2
      is_shot = Input.key_push?(K_RETURN)
      color = [255, 100, 100, 255]
      angle = 270
      font_x, font_y = 590, 590
    when 3
      is_shot = Input.key_push?(K_SPACE)
      color = [255, 100, 255, 100]
      angle = 360
      font_x, font_y = 100, 590
    when 4
      is_shot = Input.mouse_push?(M_LBUTTON)
      color = [255, 255, 255, 100]
      angle = 180
      font_x, font_y = 590, 80
  end
      
  controller.update if not controller.death
  shot_bullet(controller) if is_shot and not controller.death and not is_bullet_limit(controller)
  $death_flags[controller.id - 1] = true if controller.death

  if controller.death
    rest_bullets = 0 
  else 
    rest_bullets = get_rest_bullets(controller) 
  end

  Window.draw_font(font_x, font_y, rest_bullets.to_s, $font32, color: color, angle: angle)  
end

def get_winner_id
  $controllers.each do |c|
    if not c.death
      $winner_id = c.id
    end
  end
end

def game_start
  $finalists = [999, 999]
  $normal_music.play

  $winner_id = 0
  $death_flags = [false, false, false, false]

  $controllers << Controller1.new(20, 335, Image.load('image/player1.png'), 1, 0)
  $controllers << Controller2.new(650, 335, Image.load('image/player2.png'), 2, 180)
  $controllers << Controller3.new(335, 650, Image.load('image/player3.png'), 3, 270)
  $controllers << Controller4.new(335, 20, Image.load('image/player4.png'), 4, 90)

  loop_count = 180
  count_font = Font.new(50)
    
  Window.loop do
    loop_count -= 1

    Window.draw_font(335, 335, (loop_count / 60 + 1).to_s, count_font)

    $controllers.each do |c|
      c.draw
    end

    break if loop_count < 6
  end 
  
  font = Font.new(32)
  background = Image.load('image/window_bg.jpg')

  Window.loop do
    Window.draw(0, 0, background)

    $controllers.each do |c|
      update_controller(c)
      c.draw
    end

    $bullets.each do |b|
      b.update
      b.draw
    end

    Sprite.check($bullets, $controllers)

    $bullets.delete_if {|b| b.is_bound_limit }

    if $death_flags.count(true) >= 3
      get_winner_id
      break
    end    

    if $death_flags.count(true) == 2 and not $music_changed
      $normal_music.stop
      $one_one_music.play
	    $music_changed = true
	    pickup_finalists($death_flags)
    end
  end 
  $controllers.clear
  $bullets.clear
end

def end_screen
  return false if $winner_id == 0

  font1 = Font.new(40)
  font2 = Font.new(25)
  is_restart = false

  Window.loop do
    Window.draw(0, 0, Image.load('./image/ending.png'))
    Window.draw_font(155, 150, "#{PLAYER_COLOR[$winner_id]}が宇宙を征服した！", font1, hash = {color:PLAYER_RGB[$winner_id]})
    break if Input.key_push?(K_ESCAPE)
    Window.draw_font(185, 450, "Press SPACE to RESTART", font2)
    Window.draw_font(185, 500, "Press ESC to END THE GAME", font2)
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
  guide_screen
  game_start
  next if end_screen
  break
end