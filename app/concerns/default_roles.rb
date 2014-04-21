module DefaultRoles
  extend ActiveSupport::Concern

  def assign_default_roles
    default_roles = Setting.plugin_default_roles['default_roles'] || {}
    default_roles.each do |role_id, principal_ids|
      if principal_ids.include?(self.user_id.to_s)
        unless self.roles.where(id: role_id).exists?
          self.roles << Role.find(role_id)
        end
      end
    end
  end

  included do
    before_validation :assign_default_roles
  end
end

