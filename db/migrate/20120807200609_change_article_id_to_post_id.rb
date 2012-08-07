class ChangeArticleIdToPostId < ActiveRecord::Migration
  def up
  	rename_column :comments, :article_id, :post_id
  end

  def down
  	rename_column :comments, :post_id, :article_id
  end
end
