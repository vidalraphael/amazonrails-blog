Storytime::Tag.class_eval do
  def self.mais_usadas(quantidade = nil)
    query = joins(:posts).order('count(storytime_posts.id) desc').group('storytime_tags.id')
    if quantidade.nil?
      query
    else
      query.first quantidade
    end
  end
end