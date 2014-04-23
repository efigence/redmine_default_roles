require File.expand_path('../../test_helper', __FILE__)

class ProjectDefaultRolesTest < ActiveSupport::TestCase
  fixtures :projects, :users, :roles, :groups_users

  def setup
  end

  def random_test_name
    ('a'..'z').to_a.sample(12).join('')
  end

  def make_default_roles
    {'default_roles' => {'1' => ['1'], '2' => ['4']}}
  end

  def make_default_roles_with_groups
    {'default_roles' => {'1' => ['1'], '2' => ['10']}}
  end

  def test_blank_default_roles
    with_settings :plugin_default_roles => "" do
      tn = random_test_name
      proj = Project.create :name => tn, :identifier => tn
      assert_equal 0, proj.members.count
    end
  end

  def test_empty_default_roles
    with_settings :plugin_default_roles => {'default_roles' => {}} do
      tn = random_test_name
      proj = Project.create :name => tn, :identifier => tn
      assert_equal 0, proj.members.count
    end
  end

  def test_regular_default_roles
    with_settings :plugin_default_roles => make_default_roles do
      tn = random_test_name
      proj = Project.create :name => tn, :identifier => tn
      assert_equal 2, proj.members.count
    end
  end

  def test_regular_default_roles_with_groups
    with_settings :plugin_default_roles => make_default_roles_with_groups do
      User.current = User.find(1)
      tn = random_test_name
      proj = Project.create :name => tn, :identifier => tn
      assert_equal 2, proj.members.count
    end
  end

  def test_regular_default_roles_with_default_role
    with_settings :plugin_default_roles => make_default_roles, :new_project_user_role_id => 11 do
      User.current = User.find(1)
      tn = random_test_name
      proj = Project.create :name => tn, :identifier => tn
      assert_equal 2, proj.members.count
    end
    with_settings :plugin_default_roles => make_default_roles, :new_project_user_role_id => 11 do
      User.current = User.find(3)
      tn = random_test_name
      proj = Project.create :name => tn, :identifier => tn
      assert_equal 3, proj.members.count
    end
  end

end
