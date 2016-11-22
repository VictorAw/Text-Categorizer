require "net/http"

class TextAnalyzer
  def initialize(text)
    @text_with_parts_of_speech = get_parts_of_speech(text)
    @tokens = text_with_parts_of_speech.split

    @statistics = {
      numbers: 0,
      titles: 0,
      pronouns: 0,
      names: 0,
      quotation_marks: 0,
      adverbs: 0,
      adjectives: 0
    }

    @tokens.each do |token|

    end
  end

  def get_parts_of_speech(text)
    
  end
end
