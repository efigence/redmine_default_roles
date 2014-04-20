module DefaultMembers
  extend ActiveSupport::Concern

  def assign_default_users
    if User.current.admin?
      default_roles = Setting.plugin_default_roles['default_roles'] || {}
      default_roles.each do |role_id, principal_ids|
        new_member_role = Role.find(role_id)
        principal_ids.each do |uid|
          if current_member = Member.where(project_id: self.id, user_id: uid).first
            current_member.roles << new_member_role
          else
            self.members.build(:user_id => uid).tap do |member|
              member.roles << new_member_role
              member.save!
            end
          end
        end
      end
    end
    save!
  end

  included do
    after_create :assign_default_users
  end
end

