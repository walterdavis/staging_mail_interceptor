# frozen_string_literal: true
class CreateScoops < ActiveRecord::Migration[4.2]
  def change
    create_table :scoops do |t|
      t.string :flavor
      t.boolean :has_sprinkles
      t.boolean :has_caramel
    end
  end
end
