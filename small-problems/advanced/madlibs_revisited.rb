# MADLIBS!
require 'pry'

REPLACEMENT_WORDS = {
  '%{adjective}' => %w(
    quick lazy sleepy ugly wise humble snarky
  ),
  '%{noun}' => %w(fox dog head leg monk dragon sage
                  firetruck),
  '%{verb}' => %w(jumps lifts bites licks kicks defecates),
  '%{adverb}' => %w(easily lazily noisily excitedly magnificently
                    adorably)
}.freeze

def madlib(file_path)
  lines = File.readlines(file_path, chomp: true)

  lines.each do |line|
    words = line.split.map do |word|
      word = word.delete('^a-zA-Z{}%')
      if REPLACEMENT_WORDS[word]
        REPLACEMENT_WORDS[word].sample
      else
        word
      end
    end

    puts words.join(' ')
  end
end

madlib('file.txt')
