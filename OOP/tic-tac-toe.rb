# Load helper classes
require_relative 'player'
require_relative 'grid'

# Startup
puts 'Welcome to Tic-Tac-Toe'
puts 'Enter Player 1\'s name: '
p1name = gets.chomp()
p1 = Player.new(p1name, 'X')
puts 'Enter Player 2\'s name: '
p2name = gets.chomp()
p2 = Player.new(p2name, 'O')

# Create Grid
board = Grid.newGrid()

# Default to Player 1 going first
currentPlayer = p1

# Gameloop
count = 0
loop do
  coordX = -1
  coordY = -1
  puts
  board.printGrid
  # Begin move prompts
  loop do
  puts "\n#{currentPlayer.name}, it is your move!"
  # Prompt Valid X coordinate
  loop do
    puts "Please enter the x coordinate of your move"
    coordX = gets.chomp.to_i()
    break if coordX <= 2 && coordX >= 0
    puts "That's not a valid move"
  end
  # Prompt Valid Y coordinate
  loop do
    puts "Please enter the y coordinate of your move"
    coordY = gets.chomp.to_i()
    break if coordY <= 2 && coordY >= 0
    puts "That's not a valid move"
  end
  # Check if valid move
  break if board.placeMarker("#{currentPlayer.mark}", coordX , coordY)
  puts "That's not a valid move"
  end
  count += 1
  if board.checkwin?
    puts
    board.printGrid
    puts
    puts "Congratulations #{currentPlayer.name}, you win!"
    break
  end
  if count >= 9
    puts
    board.printGrid
    puts
    puts "It's a tie!"
    break
  end
  currentPlayer == p1 ? currentPlayer = p2 : currentPlayer = p1
end
