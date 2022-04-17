def integer?(input)
  /^-?\d+$/.match(input)
end

puts integer?("10") == true
puts integer?("4.5").nil?
