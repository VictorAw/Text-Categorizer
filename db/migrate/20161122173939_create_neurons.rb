class CreateNeurons < ActiveRecord::Migration[5.0]
  def change
    enable_extension "hstore"

    create_table :neurons do |t|
      t.string  :category,      null: false
      t.float   :threshold,     null: false
      t.float   :learning_rate, null: false
      t.hstore  :weights,       null: false

      t.timestamps
    end

    add_index :neurons, :category
  end
end
