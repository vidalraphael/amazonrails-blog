module ApplicationHelper
  def delete_resource_link(resource, href = nil, remote = true)
    humanized_resource_name = resource.class.to_s.split('::').last.underscore.humanize.downcase
    resource_name = resource.class.to_s.downcase.split("::").last

    opts = {
        id: "delete_#{resource_name}_#{resource.id}",
        class: "btn btn-danger btn-outline btn-xs btn-delete-resource delete-#{resource_name}-button",
        data: { confirm: I18n.t('common.are_you_sure_you_want_to_delete', resource_name: humanized_resource_name), resource_id: resource.id, resource_type: resource_name },
        method: :delete
    }

    if remote
      opts[:remote] = true
    end

    link_to content_tag(:i, "", class: "icon-st-icons-trash"), href || resource, opts
  end
end
