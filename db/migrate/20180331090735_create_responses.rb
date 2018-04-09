# frozen_string_literal: true

class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.references :user, foreign_key: true
      t.references :survey, foreign_key: true
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
