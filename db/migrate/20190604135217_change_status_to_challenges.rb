class ChangeStatusToChallenges < ActiveRecord::Migration[5.2]
  def change
    change_column :challenges, :status, :integer, default: 0
  end
end
