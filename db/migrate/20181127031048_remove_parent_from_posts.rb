class RemoveParentFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :posts, :parent, foreign_key: true
  end
end
