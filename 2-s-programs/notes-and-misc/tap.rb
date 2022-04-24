(1..10).tap { |x| p x }
       .to_a.tap { |x| p x }
       .select(&:even?).tap { |x| p x }
       .map { |x| x * x }.tap { |x| p x }
