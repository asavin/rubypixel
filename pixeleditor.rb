class PixelEditor
  
  def create_new_image(m, n)
    Array.new(n) { Array.new(m) {'O'} }
  end
  
  # Expected input:
  # Array of arrays of strings representing pixels
  # All pixels are reset to 'O' value
  def clear_image(pixels)
    pixels.map! { |row| row.map { |p| p = 'O'}}
  end
  
  def printout(pixels)
    pixels.each do |row|
      puts row.join
    end
  end
  
  def colour_one_pixel(pixels, x, y, colour)
    if validate_coordinates(x, 0, y, 0, pixels)
      pixels[x][y] = colour
    end
    pixels
  end
  
  def draw_vertical_segment(pixels, x, y1, y2, colour)
    if validate_coordinates(x, 0, y1, y2, pixels)
      pixels[y1..y2].map! { |row| row[x] = colour }
    end
    pixels
  end
  
  def draw_horizontal_segment(pixels, x1, x2, y, colour)
    if validate_coordinates(x1, x2, y, 0, pixels)
      pixels[y].fill(colour, x1..x2)
    end
    pixels
  end
  
  def fill_region(pixels, x, y, colour)  
    # Instance variables
    @region_map = []
    @colour = 'O'
    @image = pixels
    
    if validate_coordinates(x, 0, y, 0, pixels)
    
      # Let's find out the current color of the given pixel
      current_colour = pixels[y][x]
    
      # Now let's explore the region    
      # Let's push first pixel to the map
      @region_map << [x, y]
    
      # We are looking for pixels in all 4 directions with the same colour
      @image = pixels
      @colour = current_colour
    
      # Launching the exploration mission
      explore_around_pixel(x, y)
    
      # We are back from recursion, and we should have a region map
      @region_map.each do |point|
        @image[point[1]][point[0]] = colour
      end
      
    end
    
    @image
  end
  
  #
  # Invoking a small recursion here
  # to properly explore the region
  #
  def explore_around_pixel(x, y)
    
    # Going up
    unless y <= 0
      if @colour == @image[y-1][x]
        # Check if our map already contains this pixel
        unless @region_map.include?([x, y-1])
          @region_map << [x, y-1]
          explore_around_pixel(x, y-1)
        end
      end
    end
    
    # Going down
    unless y+1 >= @image.length
      if @colour == @image[y+1][x]
        unless @region_map.include?([x, y+1])
          @region_map << [x, y+1]
          explore_around_pixel(x, y+1)
        end
      end
    end
    
    # Going left
    unless x-1 < 0
      if @colour == @image[y][x-1]
        unless @region_map.include?([x-1, y])
          @region_map << [x-1, y]
          explore_around_pixel(x-1, y)
        end
      end
    end
    
    # Going right
    unless x+1 >= @image[0].length
      if @colour == @image[y][x+1]
        unless @region_map.include?([x+1, y])
          @region_map << [x+1, y]
          explore_around_pixel(x+1, y)
        end
      end
    end
        
  end
  
  # Checking that requested coordinates are
  # within the image size
  def validate_coordinates(x1, x2, y1, y2, pixels)
    if (pixels.length > y1 && pixels.length > y2 && pixels[0].length > x1 && pixels[0].length > x2)
      true
    else
      puts "Entered coordinates are exceeding image size"      
      false
    end
  end
end