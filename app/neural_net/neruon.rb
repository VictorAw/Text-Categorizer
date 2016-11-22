class Neuron
  attr_reader :decides, :threshold, :learning_rate, :weights

  def initialize(decides, threshold, learning_rate, weights)
    @decides = decides
    @threshold = threshold
    @learning_rate = learning_rate
    @weights = weights

    # Statistics
    @correct = 0
    @misfires = 0
    @fails = 0
  end

  def fired(vals)
    total = 0
    vals.each do |val, i|
      total += @weights[i] * val
    end

    if (total >= @threshold)
      return true
    end 

    false
  end

  def update_weights(vals, answer)
    result = check_weights(vals, answer)
    if (result == 1)
      @weights.each_key.each_with_index do |k, i|
        @weights[k] -= @learning_rate * vals[i]
      end
    elsif (result == -1)
      @weights.each_key.each_with_index do |k, i|
        @weights[k] += @learning_rate * vals[i]
      end
    end
  end

  def check_weights(vals, answer)
    has_fired = fired(vals)
    should_fire = @decides == answer

    if (!should_fire && has_fired)
      # Too sensitive
      @misfires += 1
      return 1
    elsif (should_fire && !has_fired)
      # Not sensitive enough
      @fails += 1
      return -1
    elsif (should_fire && has_fired)
      @correct += 1
      return 0
    else
      return 1
    end
  end

  def load_weights(weights)
    @weights = weights
  end

  def reset_statistics
    @correct = 0;
    @fails = 0;
    @misfires = 0;
  end
end
