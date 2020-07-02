require 'benchmark'

a1 = Array.new(1000000){ rand(100) }

a2 = a1 * 10


h1 = {}
a1.each { |x| h1[x] = :y } 


h2 = {}
a2.each { |x| h2[x] = :y }


Benchmark.bm do |x|
  x.report {
    a1.include?(999)
  }
  x.report {
    a2.include?(999)
  }
  x.report {
    h1[999] == :y
  }
  x.report {
    h2[999] == :y
  }
end
