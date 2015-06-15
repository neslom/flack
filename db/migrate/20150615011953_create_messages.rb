class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.text :channel

      t.timestamps null: false
    end
  end
end
