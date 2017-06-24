# CHALLENGE: Dynamic programming: Given a matrix consisting of 0's and 1's, 
# find the maximum size sub-matrix consisting of only 1's.
# 
# SOLUTION: Go through the each column in the matrix and calculate the total
# number of 1s' in each column using the 'calculate_histogram' function. The 
# total number of 1s' in each column will stored in a 'histogram' array. Once 
# the histogram array is built, it will be passed to the 'largest_rectangle' 
# function where the function will loop through the histogram array and 
# calculate the largest rectangular sub-matrix. It will do this by keeping 
# track of the height of each column and the position of each of the
# heights. 

# this is the matrix that will be used to calculate the largest sub-matrix
matrix = [
  [0,0,0,0,1],
  [0,0,0,0,1],
  [0,1,0,1,1],
  [0,0,1,1,1],
  [0,1,0,1,1],
  [0,1,1,1,1],
  [1,1,1,1,1]
]

# this method calculates the 'histogram,' which is used to calculate the largest sub-matrix'
def calculate_histogram(matrix)
  
  histogram = Array.new(matrix[0].length, 0) # create the array that will represent the histogram
  matrix.each_with_index do |value , index| # iterate over the first dimension of the array matrix 
    value.each_with_index do |value, index| # iterate over the second dimension of the area matrix
  # this if elseif statment is used to eiher set the histogram array value to 0 or add 1 to the
  # total in the corresponding array position
      if value == 0
        histogram[index] = 0
      elsif value == 1
        histogram[index] += value
      end
    end
  end
    # once the histogram is created, its sent to the calculate area method
    largest_rectangle(histogram)
end

# this method iterates over the histogram to set the width and height of the largest matrix
def largest_rectangle(histogram)
  position = [] # stack used to stroe the position of each height of the histogram
  height = [] # stack used to store the height of each histogram point
  area = 0 # the starting area of the sub-matrix
  last_position = 0 # used to keep track of the last postion of the position matrix
  last_index = 0 # used to keep track of the last position of the entire histogram

  histogram.each_with_index do |value, index|
    # if the height of the current position in the histogram is larger than the previous,
    # then add the current position and height to the corresponding stacks
    if index == 0 || value > height.last
      height.push(value)
      position.push(index)
    # if the height is smaller than the previous position's height, then calculate
    # the area that previous height composed.
    elsif value < height.last
      while height.length && value < height.last do
        last_position = position.last
        area = [height.pop * (index - position.pop), area].max
      end
      height.push(value)
      position.push(last_position)
    end
    last_index = index + 1
  end
  # if there is still a position stack left, calculate the areas of whats left
    while position.last do
        area = [height.pop * (last_index - position.pop), area].max
      end
  puts "The maximum size sub-matrix is: #{area}"
end

calculate_histogram(matrix)