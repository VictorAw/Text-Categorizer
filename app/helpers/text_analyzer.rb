require "algorithmia"

class TextAnalyzer
  attr_reader :statistics

  def initialize
    reset_statistics
  end
#  what I need to do
  def analyze_text(text)
    reset_statistics
    parts_of_speech = get_parts_of_speech(text).flatten
    words = text.scan(/[\w'-]+|[[:punct:]]/) # breaking up para by words and punctuations

    parts_of_speech.each do |char|
      if char == "``"
        # Counting open quotes
        @statistics[:quotes] += 1
      elsif char == 'CD'
        # May be possibly double counting decimals
        @statistics[:numbers] += 1
      elsif char == 'PRP' || char == 'PRP$'
        @statistics[:pronouns] += 1
      elsif char == 'NNP'
        @statistics[:names] += 1
      elsif char == "RB" || char ==  "RBR" || char == 'RBS'
        @statistics[:adverbs] += 1
      elsif char =='JJ' || char =='JJR' || char =='JJS'
        @statistics[:adjectives] += 1
      elsif char == ','
        @statistics[:commas] += 1
      end
    end

    # Divide each statistic with the total number of words in the text
    adjust_statistics(words.length)
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
      pronouns: 0,
      names: 0,
      quotes: 0,
      adverbs: 0,
      adjectives: 0,
      commas: 0
    }
  end

  def adjust_statistics(word_length)
    @statistics.each do |key, value|
      @statistics[key] = (value * 1.0)/word_length
    end
  end
end
