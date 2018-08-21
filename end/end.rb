require 'dxruby'

Window.width = 1000
Window.height = 600

image =  Image.load("image/116.jpg")

f = false

  Window.loop do
     if Input.key_push?(K_RETURN)
       f = true
     end
     if f == true
       Window.draw(0,0,image)
     end
  end
