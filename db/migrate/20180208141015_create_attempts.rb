class CreateAttempts < ActiveRecord::Migration[5.1]
  def change
    create_table :attempts do |t|
      t.string      :biz_id
      t.text        :functionf
      t.integer     :nb_of_second_spent
      t.integer     :nb_of_lint_warning
      t.integer     :nb_of_green_test
      t.integer     :nb_of_red_test
      t.boolean     :is_done
      
      t.timestamps
    end
  end
end
