class RemoveArticleIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :article_id, :integer
  end
end
