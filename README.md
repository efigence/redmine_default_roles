# Default roles plugin

Lets you globally assign users that are added to every new project with a certain role.

# Requirements

Developed against Redmine 2.3.3, but will probably work on any version. Needs require_relative, so either run on Ruby 1.9 or try [Backports](http://github.com/marcandre/backports).

# Installation

1. Go to your Redmine installation's plugins/ directory
2. `git clone http://github.com/efigence/redmine_default_roles_plugin`
3. Restart Redmine

# Usage

In the browser, open Administration and then Plugins. Find the plugin, click configure. You'll find a list of all roles defined in Redmine, with blank textboxes next to them. Start typing a user's name, an autocomplete (powered by the excellent [Selectize](http://brianreavis.github.io/selectize.js)) window will pop up.

To remove someone, either hit Backspace when the cursor is after their name, or click the delete buttons. Note that adding or removing someone using those lists will never add or remove them from existing projects. Your changes will only affect new projects.


