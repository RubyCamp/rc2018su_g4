require 'dxruby'

require_relative 'controller'
require_relative 'controller1'
require_relative 'controller2'
require_relative 'controller3'
require_relative 'controller4'
require_relative 'bullet'

Window.width = 690
Window.height = 690 

Window.loop do
  Window.draw(0, 0, Image.load('./image/117.jpg'))
  break if Input.key_push?(K_SPACE)
end  

c1 = Controller1.new(30, 300, Image.new(20, 20, C_RED), 1, 0)
c2 = Controller2.new(580, 270, Image.new(20, 20, C_BLUE), 2, 180)
c3 = Controller3.new(270, 580, Image.new(20, 20, C_GREEN), 3, 270)
c4 = Controller4.new(300, 20, Image.new(20, 20, C_YELLOW), 4, 90)

$bullets = Array.new
controllers = [c1, c2, c3, c4]
death_flags = [false, false, false]
winner_id = 0

def shot_bullet(controller)
    radian = controller.angle / 180.0 * Math::PI
    $bullets << Bullet.new(controller.x, controller.y, Image.new(10, 10, C_GREEN), controller.id, radian)
end 

Window.loop do
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
  
  c4.update if not c4.death
  c4.draw
  shot_bullet(c4) if Input.mouse_push?(M_LBUTTON) and not c4.death
  death_count += 1 if c4.death

  $bullets.each do |b|
    b.update
    b.draw
  end

  Sprite.check($bullets, controllers)

  $bullets.delete_if {|b| b.is_bound_limit }

  if death_flags.count(true) >= 3
    winner_id = 1 if not c1.death
    winner_id = 2 if not c2.death
    winner_id = 3 if not c3.death
    winner_id = 4 if not c4.death
    break
  end    
end

font = Font.new(32)

Window.loop do
    Window.draw_font(0, 0, winner_id.to_s, font)
end
