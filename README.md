# Default roles plugin

Lets you globally assign users or groups that are added to every new project with a certain role.

# Requirements

Developed against Redmine 2.3.3, but will probably work on any version. Needs require_relative, so either run on Ruby 1.9 or try [Backports](http://github.com/marcandre/backports).

# Installation

1. Go to your Redmine installation's plugins/ directory
2. `git clone http://github.com/efigence/redmine_default_roles_plugin default_roles`
3. Restart Redmine

_Note: in the second step we are creating a different directory, because the Redmine plugin system requires the directory and plugin name to match._

# Usage

In the browser, open Administration and then Plugins. Find the plugin, click configure. You'll find a list of all roles defined in Redmine, with blank textboxes next to them. Start typing a user's name or a group name, an autocomplete (powered by the excellent [Selectize](http://brianreavis.github.io/selectize.js)) window will pop up.

To remove someone, either hit Backspace when the cursor is after their name, or click the delete buttons. Note that adding or removing someone using those lists will never add or remove them from existing projects. Your changes will only affect new projects.

# License

    Default roles plugin
    Copyright (C) 2014  efigence S.A.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
