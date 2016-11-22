class Neuron < ApplicationRecord
  validates :category, :threshold, :learning_rate, :weights, presence: true

  after_initialize :reset_statistics

  attr_reader :correct, :fails, :misfires

  def fired(vals)
    total = 0
    self.weights.each_key do |k|
      total += self.weights[k] * vals[k]
    end

    if total >= self.threshold
      true
    else
      false
    end
  end

  def update_weights(vals, answer)
    result = check_weights(vals, answer)
    if result == 1
      self.weights.each_key do |k|
        self.weights[k] -= self.learning_rate * vals[k]
      end
    elsif result == -1
      self.weights.each_key do |k|
        self.weights[k] += self.learning_rate *vals[k]
      end
    end
  end

  def check_weights(vals, answer)
    has_fired = fired(vals)
    should_fire = this.category == answer

    if !should_fire && has_fired
      # Too sensitive
      @misfires += 1
      return 1
    elsif should_fire && !has_fired
      # Not sensitive enough
      @fails += 1
      return -1
    elsif should_fire && has_fired
      @correct += 1
      return 0
    else
      return 1
    end
  end

  def reset_statistics
    @correct = 0;
    @fails = 0;
    @misfires = 0;
  end
end
