module DefaultRoles
  extend ActiveSupport::Concern

  def assign_default_users
    default_roles = Setting.plugin_default_roles['default_roles']
    default_roles = {} unless default_roles.present?
    default_roles.each do |role_id, principal_ids|
      principal_ids.each do |uid|
        self.members.build(:user_id => uid).tap do |member|
          member.role_ids = [role_id]
          member.save!
        end
      end
    end
    save!
  end

  included do
    after_create :assign_default_users
  end
end

