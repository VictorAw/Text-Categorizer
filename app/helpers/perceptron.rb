require_relative 'text_analyzer'

class Perceptron
  # For reference
  CATEGORIES = ['Expository', 'Narrative']
  WEIGHTS = [:numbers, :pronouns, :names, :quotes, :adverbs, :adjectives, :commas, :_bias]

  def initialize()
    @neurons = Neuron.all
    @text_analyzer = TextAnalyzer.new

    reset_statistics!
  end

  def train_neurons()
    reset_statistics!

    TrainingDatum.all.each do |data|
      text_characteristics = @text_analyzer.analyze_text(data.body)
      text_characteristics[:_bias] = 1

      @neurons.each do |neuron|
        action = neuron.update_weights(text_characteristics, data.answer)
        update_statistics(action)
      end
    end

    @neurons.each do |neuron|
      neuron.save_weights
    end
  end

  def test_neurons()
    reset_statistics!

    TestingDatum.all.each do |data|
      text_characteristics = @text_analyzer.analyze_text(data.body)
      text_characteristics[:_bias] = 1

      @neurons.each do |neuron|
        action = neuron.check_weights(text_characteristics, data.answer)
        update_statistics(action)
      end
    end
  end

  def reset_statistics!
    @neurons.each do |neuron|
      neuron.reset_statistics
    end

    @correct = 0
    @fails = 0
    @misfires = 0
    @multifires = 0
  end

  def update_statistics(action)
    correct = 0
    fires = 0
    @neurons.each do |neuron|
      @misfires += neuron.misfires
      @fails += neuron.fails
      @correct = neuron.correct
    end

    # Calculate multifires
    if action == Neuron::CORRECTLY_FIRED
      correct += 1
      fires += 1
    elsif action == Neuron::MISFIRED
      fires += 1
    end

    if fires >= 2
      @multifires += 1
    end
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
    text_characteristics = @text_analyzer.analyze_text(text)
    text_characteristics[:_bias] = 1
    neurons_fired = []

    @neurons.map do |neuron|
      neurons_fired << neuron.category if neuron.fired(text_characteristics)
    end

    return neurons_fired
  end
end
