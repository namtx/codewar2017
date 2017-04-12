n, m, k = gets.split.map &:to_i
arr = gets.split.map &:to_i
max = 0
(0..n-1).to_a.repeated_permutation(m).to_a.each do |a|
  temp = arr.clone
  a.each do |e|
    temp[e] *= k
  end
  val = temp.inject(0){|r, e| r|e}
  max = val > max ? val : max
end
puts max
