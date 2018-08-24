require 'dxruby'

Window.width = 690
Window.height = 690

image =  Image.load("image/117.jpg")

f = false

  Window.loop do
     if Input.key_push?(K_RETURN)
       f = true
     end
     if f == true
       Window.draw(0,0,image)
     end
  end
