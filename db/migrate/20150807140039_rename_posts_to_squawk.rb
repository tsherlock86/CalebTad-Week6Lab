class RenamePostsToSquawk < ActiveRecord::Migration
  def change
    rename_table :posts, :squawks
  end
end
