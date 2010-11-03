begin
  require 'redmine'

  RAILS_DEFAULT_LOGGER.info 'Starting haltr plugin'

  Redmine::Plugin.register :haltr do
    name 'haltr'
    author 'Ingent'
    description 'Hackers dont do books'
    version '0.1'
    settings :default => {
      'company_name' => 'Ingent Grup Systems, SL',
      'company_tax_id' => 'B63354724'
    },
    :partial => 'haltradmin/settings'

    project_module :haltr do
      permission :general_use,
        { :clients => [:index, :edit, :new, :update, :destroy] },
        :require => :member
    end

    menu :project_menu, :haltr, { :controller => 'clients', :action => 'index' }, :caption => 'Haltr'

  end

rescue MissingSourceFile
  RAILS_DEFAULT_LOGGER.info 'Warning: not running inside Redmine'
end