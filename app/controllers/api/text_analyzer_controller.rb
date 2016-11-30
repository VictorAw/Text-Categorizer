class Api::TextAnalyzerController < ApplicationController
  def index
    perceptron = Perceptron.new
    if(params['text'].empty?)
      render json: ["Text can't be empty"], status: 404
    else
      # Uncomment this when perceptron is running

      # result = perceptron.evaluate(params['text'])
      # render json: result
      render json: [params['text']]
    end
  end
end
