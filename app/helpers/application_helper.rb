module ApplicationHelper
  def has_default_role user, role
    default_roles(role.id).include? user.id.to_s
  end

  def default_roles role_id
    if Setting.plugin_default_roles.blank? || Setting.plugin_default_roles['default_roles'].blank?
      []
    else
      Setting.plugin_default_roles['default_roles'][role_id.to_s].to_a
    end
  end
end
