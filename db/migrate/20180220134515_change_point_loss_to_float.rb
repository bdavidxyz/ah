class ChangePointLossToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :point_loss, :float
  end
end
