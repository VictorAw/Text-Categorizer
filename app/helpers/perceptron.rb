require_relative 'text_analyzer'

class Perceptron
  # For reference
  CATEGORIES = ['Expository', 'Narrative']
  WEIGHTS = [:numbers, :pronouns, :names, :quotes, :adverbs, :adjectives, :commas, :_bias]

  def initialize()
    @correct = 0
    @fails = 0
    @misfires = 0
    @multifires = 0

    @neurons = Neuron.all
    @text_analyzer = TextAnalyzer.new
  end

  def train_neurons()
    TrainingDatum.all.each do |data|
      text_characteristics = @text_analyzer.analyze_text(data.body)
      text_characteristics[:_bias] = 1

      @neurons.each do |neuron|
        action = neuron.update_weights(text_characteristics, data.answer)
        update_statistics(action)
      end
    end
  end

  def test_neurons()
    TestingDatum.all.each do |data|
      text_characteristics = @text_analyzer.analyze_text(data.body)
      text_characteristics[:_bias] = 1

      @neurons.each do |neuron|
        action = neuron.check_weights(text_characteristics, data.answer)
        update_statistics(action)
      end
    end
  end

  def update_statistics
    correct = 0
    fires = 0
    @neurons.each do |neuron|
      @misfires += neuron.misfires
      @fails += neuron.fails
      @correct = neuron.correct
    end

    # Calculate multifires
  end

  def statistics
    stats = {
      "totals" => {
        "correct" => @correct,
        "fails" => @fails,
        "misfires" => @misfires,
        "multifires" => @multifires
      }
    }
    @neurons.each do |neuron|
      stats[neuron.category] = {
        "correct" => neuron.correct,
        "fails" => neuron.fails,
        "misfires" => neuron.misfires
      }
    end
  end

  def evaluate(text)
    statistics = @text_analyzer.analyze_text(text)
    statistics[:_bias] = 1
    neurons_fired = []

    @neurons.map do |neuron|
      neurons_fired << neuron.category if neuron.fired(statistics)
    end

    return neurons_fired
  end
end
