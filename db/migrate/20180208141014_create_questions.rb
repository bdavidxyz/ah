class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.json :tests
      t.text :initial

      t.timestamps
    end
  end
end
