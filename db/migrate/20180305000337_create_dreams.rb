# frozen_string_literal: true

class CreateDreams < ActiveRecord::Migration[5.1]
  def change
    create_table :dreams do |t|
      t.text :caption, null: false

      t.timestamps
    end
  end
end
