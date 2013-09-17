# Utilizing this little gem 
# to help us with the user input
require 'highline/import'

# Our classes
require './pixeleditor'

# Initializing values
@input = []
@exit_commands = ['x', 'X', 'exit']
@the_image = []

# Initialize the Editor
@editor = PixelEditor.new

# Main app loop
while (!@exit_commands.include?(@input[0]))
  @input = ask("Editor (space sep arguments) <%= color('>', GREEN) %>  ", lambda { |str| str.split(/ \s*/) })
  
  # Check what kind of command is entered
  case @input[0]
  when 'I'
    # Create new image
    break
  when 'C'
    # Clear the image, set all pixels to 'O'
    break
  when 'L'
    # Colour one pixel with given colour
    break
  when 'V'
    # Draw a vertical segment
    break
  when 'H'
    # Draw a horizontal segment
    break
  when 'F'
    # Fill the region
    break
  when 'S'
    # Print out the current image
    break
  when 'X'
    break
  else
    puts 'Unknown command :('
  end
end

puts "Goodbye!"