# frozen_string_literal: true

class CreateEmbraces < ActiveRecord::Migration[5.1]
  def change
    create_table :embraces do |t|
      t.references :user, foreign_key: true
      t.references :dream, foreign_key: true
      t.text :testimonial, default: ''

      t.timestamps null: false
    end
  end
end
