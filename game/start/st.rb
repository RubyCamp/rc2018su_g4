require 'dxruby'

Window.width = 690
Window.height = 690

image =  Image.load("image/117.jpg")

Window.loop do
  Window.draw(0,0, image)
  break if Input.key_push?(K_ESCAPE)
end