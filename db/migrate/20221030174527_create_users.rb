# frozen_string_literal: true

# :nodoc:
class CreateUsers < ActiveRecord::Migration[7.0]
  def change # rubocop:disable Metrics/MethodLength
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password_digest
      t.string :name, null: false
      t.text :bio
      t.string :website
      t.string :location

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :name
  end
end
