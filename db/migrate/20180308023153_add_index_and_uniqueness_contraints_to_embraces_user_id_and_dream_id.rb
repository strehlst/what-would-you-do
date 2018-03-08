class AddIndexAndUniquenessContraintsToEmbracesUserIdAndDreamId < ActiveRecord::Migration[5.1]
  def change
    add_index :embraces, [:user_id, :dream_id], unique: true
  end
end
