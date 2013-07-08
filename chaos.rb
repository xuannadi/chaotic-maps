class Chaos
  
  @order = 0     # order of the square matrix
  @textMatrix = {} # 2-D array(hash) with their indices as keys 
  
  def initialize(fileName = "./sample.txt")
    @content = File.read fileName
    convertToMatrix
    puts @content+"\n"+@content.length.to_s	
  end

  def convertToMatrix # Square matrix of characters is formed
    (@content.length+1).times do |i| 
      break if (i%2 == 0 && i*i >= @content.length && @order = i)
    end
    contentArray = @content.split("")
    k=0
    tmpMatrix = []
    @order.times do |i|
      @order.times do |j|
        if k<@content.length
          tmpMatrix += [[i,j],contentArray[k]]	
	  k+=1
	else tmpMatrix += [[i,j]," "]
        end
      end
    end
    @textMatrix = Hash[*tmpMatrix]
  end 

  def bakerMap(key)
    tmpArray = []
    bakerMatrix = @textMatrix 
    key.times do
    @order.times do |i|
      @order.times do |j|
        element = bakerMatrix[[i,j]]
        if j<@order/2  
          if i%2 == 0
            tmpArray += [[@order/2 +i/2, 2*j], element]
          else 
            tmpArray += [[@order/2 +(i-1)/2, 2*j+1], element]
          end
        else
          if i%2 == 0
            tmpArray += [[i/2, 2*j-@order], element]
          else 
            tmpArray += [[(i-1)/2, 2*j+1-@order], element]
          end  
        end  
      end
    end
    bakerMatrix = Hash[*tmpArray]
    end
    return bakerMatrix
  end

  def horseShoeMap(key)
    tmpArray = []
    horseShoeMatrix = @textMatrix 
    key.times do
    @order.times do |i|
      @order.times do |j|
        if j<@order/2
          element = horseShoeMatrix[[i,j]]
          if i%2 == 0
            tmpArray += [[@order/2 +i/2, 2*j], element]
          else
            tmpArray += [[@order/2 +(i-1)/2, 2*j+1], element]
          end
        else
          element = horseShoeMatrix[[@order-1-i,3*@order/2-j-1]] 
          if i%2 == 0
            tmpArray += [[i/2, 2*j-@order], element]
          else 
            tmpArray += [[(i-1)/2, 2*j+1-@order], element]
          end
        end  
      end
    end
    horseShoeMatrix = Hash[*tmpArray]
    end
    return horseShoeMatrix
  end 

end
