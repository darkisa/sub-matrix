matrix = [
  [1,0,0,0,0],
  [1,0,0,1,1],
  [1,1,1,1,1],
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

    #once the histogram is created, its sent to the calculate area method
    area = calculate_area(histogram, area)
  end

  puts area
end

#this method iterates over the histogram to set the width and height of the largest matrix
def calculate_area(histogram, area)
  width = 0
  height = 0
  
  histogram.each_with_index do |value, index|
    if value == 0
      update_area(height, width, area) #call to update the largest area if the new value is larger
      width = 0
      height = 0
    else
      width += 1
      if height > value || height == 0
        height = value
      end
    end
  end  

  update_area(height, width, area)
end

#updates the area if a larger area is calculated 
def update_area(height, width, area)
  if area < (width * height)
    area = width * height
  end
  area
end


calculate_histogram(matrix)