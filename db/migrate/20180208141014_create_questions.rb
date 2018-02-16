class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :level
      t.datetime :available_at
      t.string :biz_id
      t.text :description
      t.jsonb :tests, default: "{}"
      t.text :initial

      t.timestamps
    end
  end
end
