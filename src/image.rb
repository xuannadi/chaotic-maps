require 'chunky_png'

class Image
  
  @fileName = "" 
  
  def initialize(fileName = "../files/sample.png")
    @fileName = fileName	
  end

  def horseShoeMap(key=2) # folded baker map
    fileName = @fileName
    key.times do
      image = ChunkyPNG::Image.from_file(fileName)
      h = image.height
      w = image.width
      scrambledImg = ChunkyPNG::Image.new(w,h, ChunkyPNG::Color::TRANSPARENT)
      im1 = image.crop(0,0,(w/2).floor,h).resize(w,(h/2).floor)
      im2 = image.crop((w/2).floor,0,(w/2).floor,h).resize(w,(h/2).floor).flip_vertically
      scrambledImg = scrambledImg.replace(im2,0,0)
      scrambledImg = scrambledImg.replace(im1,0,(h/2).floor)
      scrambledImg.save('../output/horseShoe.png')
      fileName = '../output/horseShoe.png'
    end
  end  

  def bakerMap(key=2)
    fileName = @fileName
    key.times do
      image = ChunkyPNG::Image.from_file(fileName)
      h = image.height
      w = image.width
      scrambledImg = ChunkyPNG::Image.new(w,h, ChunkyPNG::Color::TRANSPARENT)
      im1 = image.crop(0,0,(w/2).floor,h).resize(w,(h/2).floor)
      im2 = image.crop((w/2).floor,0,(w/2).floor,h).resize(w,(h/2).floor)
      scrambledImg = scrambledImg.replace(im2,0,0)
      scrambledImg = scrambledImg.replace(im1,0,(h/2).floor)
      scrambledImg.save('../output/baker.png')
      fileName = '../output/baker.png'
    end
  end

  def acMap(key=2) # Arnold's Cat Map
    fileName = @fileName
    key.times do
      image = ChunkyPNG::Image.from_file(fileName)
      h = image.height
      w = image.width
      scrambledImg = ChunkyPNG::Image.new(w, h, ChunkyPNG::Color::TRANSPARENT)
      w.times do |i|
        h.times do |j|
        p = (2*i+j)%w
        q = (i+j)%h       
        if(p==0) 
          p=w-1
        end
        if(q==0)
          q=h-1
        end
        scrambledImg[i,j] = image[p, q]
        end
      end  
      scrambledImg.save('../output/acm.png')
      fileName = '../output/acm.png'
    end
  end

end
