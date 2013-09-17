# Utilizing this little gem 
# to help us with the user input
require 'highline/import'

# Our classes
require './pixeleditor'

# Initializing values
@input = []
@exit_commands = ['x', 'X', 'exit', 'EXIT']
@the_image = []

# Initialize the Editor
@editor = PixelEditor.new

# Main app loop
while (!@exit_commands.include?(@input[0]))
  @input = ask("Editor (space sep arguments) <%= color('>', GREEN) %>  ", lambda { |str| str.split(/ \s*/) })
  
  # Check what kind of command is entered
  case @input[0].upcase
  when 'I'
    # Create new image
    @the_image = @editor.create_new_image(@input[1].to_i, @input[2].to_i)
    
  when 'C'
    # Clear the image, set all pixels to 'O'
    @the_image = @editor.clear_image(@the_image)
    
  when 'L'
    # Colour one pixel with given colour
    @the_image = @editor.colour_one_pixel(@the_image, @input[1].to_i, @input[2].to_i, @input[3])
    
  when 'V'
    # Draw a vertical segment
    @the_image = @editor.draw_vertical_segment(@the_image, @input[1].to_i, @input[2].to_i, @input[3].to_i, @input[4])
    
  when 'H'
    # Draw a horizontal segment
    @the_image = @editor.draw_horizontal_segment(@the_image, @input[1].to_i, @input[2].to_i, @input[3].to_i, @input[4])
    
  when 'F'
    # Fill the region
    
  when 'S'
    # Print out the current image
    @editor.printout(@the_image)
    
  when *@exit_commands
    break
  
  when 'HELP'
    puts "\nAvailable commands"
    puts "I M N --- Create a new M x N image with all pixels coloured white (O)"
    puts "C --- Clears the table, setting all pixels to white (O)"
    puts "L X Y C --- Colours the pixel (X,Y) with colour C"
    puts "V X Y1 Y2 C --- Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)"
    puts "H X1 X2 Y C --- Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)"
    puts "X --- exit"
    puts "\n\n"
  else
    puts 'Unknown command :( Try \'help\''
  end
end

puts "Goodbye!"