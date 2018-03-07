# frozen_string_literal: true

class ChangeUsersSetDefaultValueForEmail < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :email, :string, default: ''
  end
end
