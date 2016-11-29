class TrainingDatum < ApplicationRecord
  validates :body, uniqueness: true, presence: true
  validates :answer, presence: true
end
