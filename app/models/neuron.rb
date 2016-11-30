class Neuron < ApplicationRecord
  validates :category, :threshold, :learning_rate, :weights, presence: true

  after_initialize :reset_statistics

  attr_reader :correct, :fails, :misfires

  def fired(vals)
    total = 0
    weights = get_weights
    weights.each_key do |k|
      total += weights[k] * vals[k]
    end

    if total >= self.threshold
      true
    else
      false
    end
  end

  def update_weights(vals, answer)
    result = check_weights(vals, answer)
    weights = get_weights
    if result == 1
      weights.each_key do |k|
        change_in_weight = self.learning_rate * vals[k]
        self.weights[k.to_s] = weights[k] - change_in_weight
      end
    elsif result == -1
      weights.each_key do |k|
        change_in_weight = self.learning_rate * vals[k]
        self.weights[k.to_s] = weights[k] + change_in_weight
      end
    end
  end

  def check_weights(vals, answer)
    has_fired = fired(vals)
    should_fire = self.category == answer

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

  def save_weights
    self.save
  end

  def reset_statistics
    @correct = 0;
    @fails = 0;
    @misfires = 0;
  end

  def get_weights
    weights = {}
    self.weights.each_key do |k|
      weights[k.to_sym] = self.weights[k].to_f
    end

    weights
  end
end
