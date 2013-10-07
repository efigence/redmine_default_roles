Redmine::Plugin.register :default_roles do
  name 'Default Roles plugin'
  author 'Krzysztof Zych'
  description 'Allow adding certain people to each new project'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  
  settings :default => {'empty' => true}, :partial => 'settings/default_roles_settings'
end

require_relative 'app/helpers/application_helper.rb'
require_relative 'app/concerns/default_roles.rb'
Project.send :include, DefaultRoles
