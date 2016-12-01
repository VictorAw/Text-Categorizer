class CreateTrainingValues < ActiveRecord::Migration[5.0]
  def change
    create_table :training_values do |t|
      t.hstore :values, null: false
      t.string :answer, null: false

      t.timestamps
    end
  end
end
