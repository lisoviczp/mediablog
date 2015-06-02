class CreateVibes < ActiveRecord::Migration
  def change
    create_table :vibes do |t|
      t.string :vibeType
      t.string :title
      t.text :body
      t.string :url
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
