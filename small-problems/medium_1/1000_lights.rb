=begin
- Input: Integer (number of switches, also the number of repetitions)
- Output: Array (the lights on)
- Requirements:
  - The light switches start in the off position.
  - On each repetition, the light switches flip state on
  multiples of the current repetition.
    e.g. 4th iteration: 4, 8, 12...
  - Repeat above process until we've reached the nth.
  - Implicit Requirement:
    - The light is on when there is only a single light.
  - Questions:
    - What happens when n is a negative number?

Examples:
- n = 1 => [1]
- n = 2 => [1]
- n = 3 => [1]
- n = 4 => [1, 4]
- n = 5 => [1, 4]
- n = 6 => [1, 4]
- n = 7 => [1, 4]
- n = 10 => [1, 4, 9] # Squares of sequence 1, 2, 3...

Data Structure:
- Array or Hash
- Hash: { light: state, }

Algo:
Initialize an empty hash, lights.
Populate lights hash with n keys, one for each light and with
 the lights set to off.
Iterate over hash.
- Flip the light state if the round calls for flipping the state

Return the keys of the hash

=end

def flip_lights(lights, round)
  lights.each { |light, state| lights[light] = !state if light % round == 0 }
end

def thousand_lights(repetitions)
  lights = {}
  (1..repetitions).each { |light| lights[light] = false }
  (1..repetitions).each { |round| lights = flip_lights(lights, round) }

  lights.select { |_, on| on }.keys
end

# Revision after using brute force solution to check hypothesis 

def mathy_lights(num_lights) 
  lights_on_arr = [] 

  while light_no**2 <= num_lights
    lights_on_arr << light_no**2 
    light_no += 1
  end 

  lights_on_arr
end 

# Refactor mathy_lights after viewing LS solution 

def mathy_lights(num_lights) 
  lights_on = [] 
  
  1.upto(num_lights**0.5)  { |light_no| lights_on << light_no**2 }

  lights_on
end 

# Further Exploration: Printing the Rounds and lights... 

def init_lights(num_lights) 
  lights = {} 
  (1..num_lights).each { |light| lights[light] = "off" }
  lights 
end 

def flip_lights(lights, round)
  lights.each do |light, state| 
    if light % round == 0 
      if    state == "on"   then state = "off" 
      elsif state == "off"  then state = "on" end

      lights[light] = state
    end 
  end
end

def select_lights(lights, state)
  lights = lights.select {|_, status | state == status  }.keys
  lights
end 

def format_plurals(lights)
  case (lights.size) 
  when 1 then lights[0]
  when 2 then lights.join(" and ")
  else        lights[0..-2].join(", ") + " and " + lights[-1].to_s
  end 
end 

def print_round_results(round, lights) 
  if select_lights(lights, "off").empty? 
    puts "round #{round}: every light is turned on" 
    return 
  end 

  off = format_plurals(select_lights(lights, "off"))
  on = format_plurals(select_lights(lights, "on"))

  puts %(round #{round}: lights #{off} are now off; #{on} are on)
end 

def thousand_lights(num_lights)
  lights = init_lights(num_lights)

  1.upto(num_lights) do |round| 
    lights = flip_lights(lights, round) 
    print_round_results(round, lights) 
  end 

  select_lights(lights, "on")
end

p thousand_lights(10)

