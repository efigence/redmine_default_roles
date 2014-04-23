module DefaultMembers
  extend ActiveSupport::Concern

  def assign_default_users
    # add default members from plugin

    default_roles = Setting.plugin_default_roles['default_roles'] || {}
    default_roles.each do |role_id, principal_ids|
      new_member_role = Role.find(role_id)
      principal_ids.each do |uid|
        member = Member.where(project_id: self.id, user_id: uid).first || self.members.build(:user_id => uid)
        member.roles << new_member_role
        member.save
      end
    end

    # add default role from redmine project settings
    if !User.current.admin?
      role = Role.givable.find_by_id(Setting.new_project_user_role_id.to_i) || Role.givable.first
      if role
        member = Member.where(project_id: self.id, user_id: User.current.id).first || self.members.build(:user_id => User.current.id)
        member.roles << role
        member.save
      end
    end

    save!
  end

  included do
    after_create :assign_default_users
  end
end

