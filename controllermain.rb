require 'dxruby'

require_relative 'controller'
require_relative 'controller1'
require_relative 'controller2'
require_relative 'controller3'
require_relative 'controller4'
require_relative 'bullet'


c1 = Controller1.new(0, 300, Image.new(20, 20, C_RED))

c2 = Controller2.new(580, 300, Image.new(20, 20, C_BLUE))

c3 = Controller3.new(300, 580, Image.new(20, 20, C_GREEN))

c4 = Controller4.new(300, 0, Image.new(20, 20, C_YELLOW))

Window.width = 600
Window.height = 600

$bullets = Array.new

def shot_bullet(controller)
    radian = controller.angle / 180 * Math::PI
    $bulltes << Bullet.new(controller.x, controller.y, Image.new(10, 10, C_GREEN), radian)
end 

Window.loop do
  c1.update
  c1.draw
  shot_bullet(c1) if Input.key_down?(K_LSHIFT)

  c2.update
  c2.draw
  shot_bullet(c2) if Input.key_down?(K_RSHIFT)

  c3.update
  c3.draw
  shot_bullet(c3) if Input.key_down?(K_SPACE)
  
  c4.update
  c4.draw
  shot_bullet(c4) if Input.mouse_down?(M_LBUTTON)

  $bulltes.each do |b|
    b.update
    b.draw
  end

  $bulltes.delete_if {|b| b.isBoundLimit }
end





