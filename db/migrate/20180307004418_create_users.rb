# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :public_name, null: false
      t.string :email

      t.timestamps null: false
    end
  end
end
