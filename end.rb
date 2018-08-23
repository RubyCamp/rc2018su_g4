
image =  Image.load("image/ending.png")

f = false

  Window.loop do
     if Input.key_push?(K_RETURN)
       f = true
     end
     if f == true
       Window.draw(0,0,image)
     end
  end
