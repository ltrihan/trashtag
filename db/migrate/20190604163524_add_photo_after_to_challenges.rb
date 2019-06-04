class AddPhotoAfterToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :photo_after, :string
  end
end
