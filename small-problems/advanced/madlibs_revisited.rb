# MADLIBS! 
require 'pry' 

REPLACEMENT_WORDS = {
  '%{adjective}' => [
    'quick', 'lazy', 'sleepy', 'ugly', 'wise', 'humble', 'snarky'],
  '%{noun}' => [ 'fox', 'dog', 'head', 'leg', 'monk', 'dragon', 'sage', 'firetruck'],
  '%{verb}' => ['jumps', 'lifts', 'bites', 'licks', 'kicks', 'defecates'], 
  '%{adverb}' => ['easily', 'lazily', 'noisily', 'excitedly', 'magnificently', 'adorably'] 
}


def madlib(file_path) 
  lines = File.readlines(file_path, chomp: true) 
  
  lines.each do | line | 
    words = line.split.map do | word |
      word = word.delete("^a-zA-Z{}%")
      if REPLACEMENT_WORDS[word] 
        REPLACEMENT_WORDS[word].sample
      else 
        word 
      end 
    end 
    
    puts words.join(" ")
  end 
end 

madlib("file.txt")