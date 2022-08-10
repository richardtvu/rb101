# Lessons Learned While Doing Twenty One

1. Make sure to keep methods as de-coupled as possible.
   - I was gave into temptation to pair my `update_total!` method within the `deal!(card)` method, which ended up making it more difficult to debug a problem with aces. If I were to re-do the 21 game, I'd have separated the two methods.

2. Show work to peers while working on the code.
   - By working with my peers to review my code, I got exposed to cool new ideas, e.g. the best data structure to represent the cards, how to pretty print the cards in a dynamic fashion.

3. Start with flowcharts.
   - When I first tried to do the twenty one game from just the computer, I got stuck a lot because I ended up hack and slashing. By going back to the basics and using flow charts to get my main programs first and then decomposing the program into small little chunks, I worked out most of the chinks in program logic _before_ trying to code. This process took about 2 weeks, but I ended up having a much more enjoyable programming experience and my peers said my code was cleaner!


