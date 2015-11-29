# require_dependency 'models/storytime/blog_post'
Storytime::Post.class_eval do
  is_impressionable counter_cache: true, unique: :session_hash
end