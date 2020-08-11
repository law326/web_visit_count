# frozen_string_literal: true

class CreateWebLog < ActiveRecord::Migration[6.0]
  def change
    create_table :web_logs do |t|
      t.string :visited_url, null: false
      t.string :from_ip, null: false

      t.timestamps
    end
  end
end
