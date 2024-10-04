=begin

The #{adjective} brown #{noun} #{adverb}
#{verb} the #{adjective} yellow
#{noun}, who #{adverb} #{verb} his
#{noun} and looks around.

Make a madlibs program that reads in some text from a text file that you have 
created, and then plugs in a selection of randomized nouns, verbs, adjectives, 
and adverbs into that text and prints it. You can build your lists of nouns, 
verbs, adjectives, and adverbs directly into your program, but the text data 
should come from a file or other external source. Your program should read this 
text, and for each line, it should place random words of the appropriate types 
into the text, and print the result.


ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end



=end


verb = %w(jumps lifts bites licks)
adjective = %w(quick lazy sleepy ugly)
noun = %w(fox dog cat mouse head tail)
adverb = %w(easily lazily noisily excitedly)


File.foreach ('mad_libs.txt') do |line|
  sentence = line % { :adverb => adverb.sample, :verb => verb.sample, 
  :adjective => adjective.sample, :noun => noun.sample }
  p sentence
end