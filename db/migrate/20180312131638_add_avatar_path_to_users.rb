# frozen_string_literal: true

class AddAvatarPathToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :avatar_path, :string, null: true, unique: true
  end

  def down
    remove_column :users, :avatar_path
  end
end
