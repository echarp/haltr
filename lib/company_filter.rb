module CompanyFilter

  unloadable

  def check_for_company
    Project.send(:include, ProjectHaltrPatch) #TODO: perque nomes funciona el primer cop sense aixo?
    if @project.company.nil?
      c = Company.new(:project=>@project,:name=>@project.name)
      c.save(false)
      @project.reload
    end
    unless @project.company.valid?
      flash[:error] = l(:halt_configure_before_use)
      redirect_to :controller => :companies, :action => :index, :id => @project
    end
  end

end
