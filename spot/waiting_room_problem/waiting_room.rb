require 'pry'

def middle_chair(chairs_arr)
  index = chairs_arr.size / 2
  index -= 1 if chairs_arr.size.even?

  chairs_arr[index]
end

# Constraint: All chairs must be uniquely numbered, e.g. only one 5th chair.
def groups(chairs_arr, middle_chair)
  
  chairs = chairs_arr.dup

  chairs.delete(middle_chair)
  chairs.partition { |chair| chair < middle_chair }
end

def select_some_seats(groups_of_seats)
  chairs_chosen = []
  remaining_groups = []

  until groups_of_seats.empty?
    group = groups_of_seats.shift
    middle_chair = middle_chair(group)

    chairs_chosen << middle_chair
    groups(group, middle_chair).each do |grp|
      remaining_groups << grp unless grp.empty?
    end
  end
  [chairs_chosen, remaining_groups]
end

# Input:
# Output:
def sort(seats)
  groups_by_size = seats.group_by(&:size)

  groups_of_groups = groups_by_size.sort_by { |size, _| -size }
  groups_of_groups.map! do |(_size, group_of_seats)|
    group_of_seats.sort!
  end

  ordered_groups = []
  groups_of_groups.each do |groups_of_seats|
    groups_of_seats.each do |group|
      ordered_groups << group
    end
  end

  ordered_groups
end


def select_some_seats(groups_of_seats)
  chairs_chosen = []
  remaining_groups = []

  until groups_of_seats.empty?
    # binding.pry
    group = groups_of_seats.shift
    middle_chair = middle_chair(group)
    # binding.pry
    chairs_chosen << middle_chair
    groups(group, middle_chair).each do |grp|
      remaining_groups << grp unless grp.empty? 
    end
  end
  [chairs_chosen, remaining_groups]
end

def order_seats_taken(num_seats)
  order_taken = [1, num_seats]
  groups_of_seats = [(2...num_seats).to_a]

  loop do
    chairs_chosen, remaining_groups = select_some_seats(groups_of_seats)

    break if chairs_chosen.empty?
    order_taken.concat(chairs_chosen)
    groups_of_seats = sort(remaining_groups)
  end
  order_taken
end

def last_chair(num_seats)
  order_seats_taken(num_seats).last
end

# =============================== Test Cases ================================

SEATS_TAKEN_ORDER = {
  3 => [1, 3, 2],
  4 => [1, 4, 2, 3],
  5 => [1, 5, 3, 2, 4],
  10 => [1, 10, 5, 7, 3, 8, 2, 4, 6, 9],
  12 => [1, 12, 6, 9, 3, 4, 7, 10, 2, 5, 8, 11]
}

def run_tests
  SEATS_TAKEN_ORDER.each do |num_seats, expected_order|
    puts "Seats: #{num_seats}"
    puts "Expected Order: #{expected_order}"

    actual_order_taken = order_seats_taken(num_seats)
    puts "Test Pass?: #{
    expected_order == actual_order_taken &&
    last_chair(num_seats) == actual_order_taken.last
  }"
    puts
  end
end

run_tests
# [3, 4, 5, 10, 12].each do |seats|
#   p "Seats: #{seats}", "Last chair: #{last_chair(seats)}"
#   puts
# end
