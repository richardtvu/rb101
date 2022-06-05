=begin 
- Input: String (representing programs)
- Output: The results? 

- Requirements: 
  - The input string represents commands separated by spaces. 
  - Implement a stack-and-value register. 
  - Use an Array to implement the stack. 
  - The stack-and-register programming language uses a **register**, the current value. 
  - Operations with two values pop the topmost item from stack, the most recently pushed value. 
  - Do the op with the register value and the popped value, store the result in the register. 
  - Implement the following commands: 
    - `n` push `n` to register without modifying stack. 
    - `PUSH` - register value to stack while keeping value in register. 
    - `ADD`. Pop from stack, do add, store result in register. 
    - `SUB`. ^, do SUB, ^. 
    - `MULT`. 
    - `DIV`. 
    - `MOD`. 
    - `POP`. Remove topmost item from stack and put in register. 
    - `PRINT`. Print register value. 
  - Initialize register to 0. 
  - Assume all programs are correct. 

  Does the register reset to 0 after each program completes? 

Examples: 
- Operation: `MULT`
- Before operation: 
  - Stack: `3 6 4`, `4` is topmost 
  - Register: `7`. 
- The `MULT` operation pops `4` from the stack, multiplies the `4` by `7` and stores `28` in the register. 
  - Stack: `3 6`
  - Register: `28`

Data Structure?
- Array to store the program commands. 

Algorithm: 
- Iterate over the commands in the program. 
  - Execute each command. 
=end 


def execute(command, stack, register)
  case(command)
  when "PUSH"   then stack.push(register)
  when "ADD"    then register += stack.pop
  when "SUB"    then register -= stack.pop 
  when "MULT"   then register *= stack.pop 
  when "DIV"    then register /= stack.pop 
  when "MOD"    then register %= stack.pop 
  when "POP"    then register = stack.pop 
  when "PRINT"  then puts register
  else               register = command.to_i 
  end 
  register 
end 

def minilang(program_str) 
  program = program_str.split
  register = 0 
  stack = [] 

  program.each { |command| register = execute(command, stack, register) } 
end 


# minilang('PRINT')
# 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)