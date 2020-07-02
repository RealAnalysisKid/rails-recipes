require 'benchmark'

def binary_search(arr, element)
 m = arr.size - 1
 n = 0

 while n <= m
   mid = (m + n) / 2

   if arr[mid] > element
     m = mid - 1
   elsif arr[mid] < element
     n = mid + 1
   else
     break
   end
 end

 puts mid
end

def sorted_arr(size)
  arr = Array.new(size) {rand(1000)}
  arr.sort
end

arr1 = sorted_arr(10)
arr2 = sorted_arr(10000)
arr3 = sorted_arr(1000000)

Benchmark.bm do |x|
  x.report {
   binary_search(arr1, 33)
  }
  x.report {
    binary_search(arr2, 913)
  }
  x.report {
    binary_search(arr3, 423)
  }
end
