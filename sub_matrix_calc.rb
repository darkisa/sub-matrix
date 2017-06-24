matrix = [
  [0,0,0,0,0],
  [0,0,0,0,0],
  [0,1,0,1,0],
  [0,1,1,1,0],
  [0,1,1,1,1],
  [0,1,1,1,1],
  [1,1,1,1,1]
]

#this method calculates the 'histogram,' which is used to calculate the biggest 1 sub-matrix'
def calculate_histogram(matrix)
  
  area = 0 #starting area
  histogram = Array.new(matrix[0].length, 0) #create the array that will represent the histogram
  matrix.each_with_index do |value , index| #iterate over the first dimension of the array matrix 
    value.each_with_index do |value, index| #iterate over the second dimension of the area matrix
      if value == 0 #this if elseif statment is used to eiher set the histogram array values to 0 or add 1
        histogram[index] = 0
      elsif value == 1
        histogram[index] += value
      end
    end
  end
    #once the histogram is created, its sent to the calculate area method
    largest_rectangle(histogram)
end

#this method iterates over the histogram to set the width and height of the largest matrix
def largest_rectangle(histogram)
  position = []
  height = []
  area = 0
  last_position = 0
  last_index = 0

  histogram.each_with_index do |value, index|
    if index == 0 || value > height.last
      height.push(value)
      position.push(index)
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
    while position.last do
        area = [height.pop * (last_index - position.pop), area].max
      end
  puts "The maximum size sub-matrix is: #{area}"
end

calculate_histogram(matrix)