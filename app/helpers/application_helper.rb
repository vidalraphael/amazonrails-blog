module ApplicationHelper
  def delete_resource(resource, href = nil, remote = true, options = {})
    humanized_resource_name = resource.class.to_s.split('::').last.underscore.humanize.downcase
    resource_name = resource.class.to_s.downcase.split("::").last

    opts = {
        id: "delete_#{resource_name}_#{resource.id}",
        class: "red btn-floating waves-effect waves-light btn-delete-resource delete-#{resource_name}-button",
        data: { confirm: I18n.t('common.are_you_sure_you_want_to_delete', resource_name: humanized_resource_name), resource_id: resource.id, resource_type: resource_name },
        method: :delete
    }.merge(options)

    if remote
      opts[:remote] = true
    end

    link_to content_tag(:i, "delete", class: "material-icons"), href || resource, opts
  end

  def posts_recentes
    posts_publicados.order(published_at: :desc).take(3)
  end

  def posts_populares
    posts_publicados.order(impressions_count: :desc).take(3)
  end

  private
  def posts_publicados
    Storytime::BlogPost
        .where('published_at IS NOT NULL')
        .where('published_at < ?', Time.now)
  end
end
