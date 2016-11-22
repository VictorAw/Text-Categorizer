class CreateTrainingData < ActiveRecord::Migration[5.0]
  def change
    create_table :training_data do |t|
      t.string :body, null: false
      t.string :answer, null: false
      t.timestamps
    end
  end
end
