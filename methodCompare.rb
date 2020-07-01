require 'benchmark'

arr1 = [1,2,3] # []
arr2 = [1,1,2] # [1]
arr3 = [1,1,2,2] # [1,2]

def find_dup_v1(arr)
  unique_arr = []
  dup_arr = []

  arr.each do |a| # O(N)
    if unique_arr.include?(a) # O(N)
      dup_arr << a
    else
      unique_arr << a
    end
  end

  return dup_arr
end

def find_dup_v2(arr)
  unique_hash =  {}
  dup_arr = []

  arr.each do |a| # O(N)
    if unique_hash[a] # O(1)
      dup_arr << a
    else
      unique_hash[a] = true
    end
  end


  return dup_arr
end


Benchmark.bm do |x|
  x.report {
    print "arr"
    find_dup_v1(arr1)
  }
  x.report {
    print "hash"
    find_dup_v2(arr1)
  }
  x.report {
    print "arr"
    find_dup_v1(arr2)
  }
  x.report {
    print "hash"
    find_dup_v2(arr2)
  }
  x.report {
    print "arr"
    find_dup_v1(arr3)
  }
  x.report {
    print "hash"
    find_dup_v2(arr3)
  }
end
