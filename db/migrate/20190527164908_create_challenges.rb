class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :place
      t.integer :status
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
