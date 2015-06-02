class AddUidToVibe < ActiveRecord::Migration
  def change
    add_column :vibes, :uid, :string
  end
end
