class AddScoreToAttempt < ActiveRecord::Migration[5.1]
  def change
    add_column :attempts, :score, :string
  end
end
