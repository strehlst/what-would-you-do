# frozen_string_literal: true

class AddIndexAndUniquenessContraintsToEmbracesUserIdAndDreamId < ActiveRecord::Migration[5.1]
  def change
    add_index :embraces, %i[user_id dream_id], unique: true
  end
end
