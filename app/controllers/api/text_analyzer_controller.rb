class Api::TextAnalyzerController < ApplicationController
  def index
    render json: ['hello']
  end
end
