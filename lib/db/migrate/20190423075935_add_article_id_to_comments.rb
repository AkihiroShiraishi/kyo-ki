class AddArticleIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :article_id, :integer,  foreign_key: true
  end
end
