class AddSourceToPost < ActiveRecord::Migration
  def change
    add_column :posts, :source, :string
  end
end
