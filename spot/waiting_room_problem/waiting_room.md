# Waiting Room 

There's a waiting room with N chairs set in single row. Chairs are consecutively numbered from 1 to N. First is closest to the entrance (which is exit as well).

For some reason people choose a chair in the following way

1. Find a place as far from other people as possible
2. Find a place as close to exit as possible

All chairs must be occupied before the first person will be served

So it looks like this for 10 chairs and 10 patients


| Chairs   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  |
| -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Patients | 1   | 7   | 5   | 8   | 3   | 9   | 4   | 6   | 10  | 2   |

```
Input: number of chairs N, an integer greater than 2.
Output: a positive integer, the last patient's chair number.
```

Sample Test: 
```rb
RSpec.describe 'last_chair' do
  it 'should return 10 for n = 9' do
    expect(last_chair(10)).to eq(9)
  end
end
```

```rb
def last_chair(n)
  # TODO
end
```

**JD's Challenge**: 
Find a different return. Return the entire array with each index representing the seat in the order it was taken.

So don't return the last seat taken. Return an array of every seat in the order that they were taken. It's definitely a little harder than a 6kyu. But a really cool exercise. Good luck! See you in a week