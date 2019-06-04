class ChangeStatusToChallenges < ActiveRecord::Migration[5.2]
  def change
    change_column :challenges, :status, defaut: 0
  end
end
