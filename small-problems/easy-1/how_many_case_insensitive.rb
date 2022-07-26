def count_occurrences(array)
  occurrences = {}

  uniq_array = array.map(&:downcase).uniq
  uniq_array.each do |element|
    occurrences[element] =
      array.map(&:downcase).count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

vehicles = %w(
  Car car truck car SUV truck
  motorcycle motorcycle car truck
)

count_occurrences(vehicles)
