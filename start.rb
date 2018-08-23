def start_screen
   image =  Image.load("image/117.jpg")

   Window.loop do
     Window.draw(0,0, image)
     break if Input.key_push?(K_SPACE)
   end
end
