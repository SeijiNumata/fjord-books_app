# frozen_string_literal: true

class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :string, null: false,unique:true
    add_column :users, :provider, :string, null: false, default: ''
    add_index :users, %i[uid], unique: true
  end
end
