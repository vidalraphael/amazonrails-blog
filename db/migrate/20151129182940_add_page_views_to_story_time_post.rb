class AddPageViewsToStoryTimePost < ActiveRecord::Migration
  def change
    add_column :storytime_posts, :page_views, :integer, default:  0
    execute 'UPDATE storytime_posts SET page_views = 0'
  end
end
