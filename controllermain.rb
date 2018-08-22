require 'dxruby'

require_relative 'controller'
require_relative 'controller1'
require_relative 'controller2'
require_relative 'controller3'
require_relative 'controller4'
require_relative 'bullet'


c1 = Controller1.new(1, 300, Image.new(20, 20, C_RED))
c2 = Controller2.new(580, 280, Image.new(20, 20, C_BLUE))
c3 = Controller3.new(280, 580, Image.new(20, 20, C_GREEN))
c4 = Controller4.new(300, 0, Image.new(20, 20, C_YELLOW))

c1.angle = 0
c2.angle = 180
c3.angle = 90
c4.angle = 270

Window.width = 600
Window.height = 600

$bullets = Array.new

def shot_bullet(controller, id)
    radian = controller.angle / 180.0 * Math::PI
    $bullets << Bullet.new(controller.x, controller.y, Image.new(10, 10, C_GREEN), id, radian)
end 

Window.loop do
  c1.update
  c1.draw
  shot_bullet(c1, 1) if Input.key_push?(K_LSHIFT)

  c2.update
  c2.draw
  shot_bullet(c2, 2) if Input.key_push?(K_RSHIFT)

  c3.update
  c3.draw
  shot_bullet(c3, 3) if Input.key_push?(K_SPACE)
  
  c4.update
  c4.draw
  shot_bullet(c4, 4) if Input.mouse_push?(M_LBUTTON)

  $bullets.each do |b|
    b.update
    b.draw
  end

  $bullets.delete_if {|b| b.is_bound_limit }
end





