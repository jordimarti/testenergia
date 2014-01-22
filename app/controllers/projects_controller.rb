class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  def index
    this_user = User.find(current_user.id)
    @projects = this_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # Save the object
    if @project.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "El projecte s'ha creat correctament."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @project = Project.find(params[:id])
    # Update the object
    if @project.update_attributes(project_params)
      # If save succeeds, redirect to the index action
      flash[:notice] = "Les dades del projecte s'han gravat correctament."
      redirect_to(:action => 'show', :id => @project.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @project = Project.find(params[:id])
  end

  def destroy
    project = Project.find(params[:id]).destroy
    flash[:notice] = "El projecte '#{project.name}' ha estat correctament eliminat."
    redirect_to(:action => 'index')
  end

  def create_from_project
    # Creates an xproject (project for experts) with the user project data. 
    @project = Project.find(params[:id])
    @xproject = Xproject.new()
    if @xproject.update_attributes(@project.attributes)
      flash[:notice] = "El projecte s'ha passat a un expert."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  private
    def project_params
      params.require(:project).permit(:user_id, :expert_id, :name, :region, :address, :cadastre, :construction_period, :project_type, :area, :facade_improvements, :roof_improvements, :window_type, :window_improvements, :hot_water_type, :hot_water_improvements, :heating_type, :heating_improvements, :cooling_type, :cooling_improvements, :contracted_power, :refrigerator_power, :microwave_power, :washingmachine_power, :dishwasher_power, :oven_power, :vitroceramic_power, :tv_power, :pc_power, :stereo_power, :coffeemachine_power, :lighting_type, :lighting_improvements, :lighting_power, :ventilation_type, :solarprotection_type, :maintenance_type, :energy_class_guess, :energy_class)
    end
end
