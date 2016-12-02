class StaticPagesController < ApplicationController
  def root
    Perceptron.instance
  end
end
