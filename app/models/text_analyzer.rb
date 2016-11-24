#Moved into models to make testing easier. Was in helper earlier

require "algorithmia"

class TextAnalyzer
  attr_reader :statistics

  def initialize
    @statistics = {
      numbers: 0,
      titles: 0,
      pronouns: 0,
      names: 0,
      quotes: 0,
      adverbs: 0,
      adjectives: 0
    }
  end
#  what I need to do
  def analyze_text(text)
    reset_statistics

    @parts_of_speech = get_parts_of_speech(text)
    # Add to statistics here
    # Divide each statistic with the total number of words in the text
    @statistics.values.each_with_index do |val, i|
      @statistics[@statistics.keys[i]] = val.to_f / tokens.to_f
    end

    @statistics
  end

  def get_parts_of_speech(text)
    client = Algorithmia.client(Figaro.env.algorithmia_testing_key)
    algorithm = client.algo("StanfordNLP/POSTagger/0.1.0")
    algorithm.pipe(text).result
  end

  def reset_statistics
    @statistics = {
      numbers: 0,
      titles: 0,
      pronouns: 0,
      names: 0,
      quotes: 0,
      adverbs: 0,
      adjectives: 0
    }
  end
end

class String
  def is_num?
    true if Float self rescue false
  end
end
