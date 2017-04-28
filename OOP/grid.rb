require_relative 'cell'

class Grid
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def Grid.newGrid()
    tempArr = []
    3.times do
      tempArr << [Cell.new(), Cell.new(), Cell.new()]
    end
    Grid.new(tempArr)
  end

  def placeMarker(mark, x, y)
    val = false
    if @grid[x][y].item == " "
      @grid[x][y].item = mark
      val = true
    end
    val
  end

  def checkwin?
    win = false

    # Check Vertical win conditions
    3.times() do |n|
      test = true
      unless @grid[n][0].item == " "
        mark = @grid[n][0].item
        2.times() do |x|
          test = false unless mark == @grid[n][x + 1].item
          puts "1" + test.to_s
        end
      else
        test = false
      end
      win = true if test
    end
    puts win
    # Check Horizontal win conditions
    3.times() do |n|
      test = true
      unless @grid[0][n].item == " "
        mark = @grid[0][n].item
        2.times() do |x|
          test = false unless mark == @grid[x + 1][n].item
        end
      else
        test = false
      end
      win = true if test
    end
    puts win

    # Diagonal left to right
    win = true if @grid[0][0].item == @grid[1][1].item && @grid[0][0].item == @grid[2][2] && @grid[0][0].item != " "
    puts win
    # Diagonal right to left
    win = true if @grid[2][0].item == @grid[1][1].item && @grid[2][0].item == @grid[0][2] && @grid[2][0].item != " "
    puts win

    win
  end

  def printGrid
    puts "0 #{@grid[0][0].item}|#{@grid[1][0].item}|#{@grid[2][0].item}"
    puts "  -----"
    puts "1 #{@grid[0][1].item}|#{@grid[1][1].item}|#{@grid[2][1].item}"
    puts "  -----"
    puts "2 #{@grid[0][2].item}|#{@grid[1][2].item}|#{@grid[2][2].item}"
    puts
    puts "  0 1 2  "
  end


end
