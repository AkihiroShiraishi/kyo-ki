class AddTextToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :text, :text, null: false
  end
end
