STARS = ['*', '*', '*'].freeze
def star(length)
  center_idx = length / 2

  length.times do |row_idx| # e.g. 0, 1, ..., 6
    distance = (center_idx - row_idx).abs
    num_spaces = distance - 1
    if num_spaces >= 0
      stars = STARS.join(' ' * num_spaces)
      puts stars.center(length)
    else
      puts '*' * length
    end
  end
end

star(7)

star(9)
