require 'dxruby'

Window.width = 1000
Window.height = 600

image =  Image.load("image/116.jpg")

Window.loop do
  Window.draw(0,0, image)
  break if Input.key_push?(K_ESCAPE)
end