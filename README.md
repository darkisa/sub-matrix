# sub-matrix
Dynamic programming: Given a matrix consisting of 0's and 1's, find the maximum size sub-matrix consisting of only 1's.

To find the maximum size sub-matrix within a binary matrix, I loop through each column of the matrix and store the largest number of consecutive 1s in each column. This builds a histogram with varying heights. I then pass the histogram to a seperate function that loops through each value in the histogram, storing the position and height of data point. The position and heights of each data point are then used to calculate the maximum size sub-matrix. 

More details in the code.
