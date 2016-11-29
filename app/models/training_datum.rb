class TrainingDatum < ApplicationRecord
  validates :body, unique: true
end
