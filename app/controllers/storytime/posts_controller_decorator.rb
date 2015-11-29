Storytime::PostsController.class_eval do
  def show
    params[:id] = params[:id].split("/").last

    @post = if params[:preview]
              Storytime::Post.find_preview(params[:id])
            else
              Storytime::Post.published.friendly.find(params[:id])
            end

    authorize @post

    impressionist(@post, 'pageview') if params[:preview].nil?

    content_for :title, "#{@current_storytime_site.title} | #{@post.title}"

    @comments = @post.comments.order("created_at DESC")
    #allow overriding in the host app
    if params[:preview].nil? && !view_context.current_page?(storytime.post_path(@post))
      redirect_to storytime.post_path(@post), :status => :moved_permanently
    elsif lookup_context.template_exists?("storytime/#{@current_storytime_site.custom_view_path}/#{@post.type_name.pluralize}/#{@post.slug}")
      render "storytime/#{@current_storytime_site.custom_view_path}/#{@post.type_name.pluralize}/#{@post.slug}"
    elsif !lookup_show_template_override.nil?
      render lookup_show_template_override
    end
  end
end