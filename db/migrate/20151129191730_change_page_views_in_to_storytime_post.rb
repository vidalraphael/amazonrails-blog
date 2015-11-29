class ChangePageViewsInToStorytimePost < ActiveRecord::Migration
  def change
    add_column :storytime_posts, :impressions_count, :integer, default: 0
    remove_column :storytime_posts, :page_views
  end
end
