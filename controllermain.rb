require 'dxruby'
require_relative 'controller'
require_relative 'controller1'
require_relative 'controller2'
require_relative 'controller3'
require_relative 'controller4'


c1 = Controller1.new(0, 300, Image.new(20, 20, C_RED))

c2 = Controller2.new(580, 300, Image.new(20, 20, C_BLUE))

c3 = Controller3.new(300, 580, Image.new(20, 20, C_GREEN))

c4 = Controller4.new(300, 0, Image.new(20, 20, C_YELLOW))

Window.width = 600
Window.height = 600

Window.loop do
  c1.update
  c1.draw

  c2.update
  c2.draw

  c3.update
  c3.draw
  
  c4.update
  c4.draw

end





