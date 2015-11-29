# require_dependency 'models/storytime/blog_post'
Storytime::Post.class_eval do
  is_impressionable counter_cache: true, unique: :session_hash

  def similares(quantidade = nil)
    query = Storytime::Post.joins(:tags)
                .where('storytime_tags.id IN (?)', tags.map { |tag| tag.id })
                .where('storytime_posts.id != ?', id)
                .where('published_at IS NOT NULL')
                .where('published_at < ?', Time.now)
                .group('storytime_posts.id')
                .order('impressions_count DESC, published_at DESC')

    return query if quantidade.nil?
    query.first quantidade
  end
end