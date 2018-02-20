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

      t.integer  :point_max
      t.integer  :point_loss_per_second
      t.integer  :point_plateau

      t.timestamps
    end
  end
end
