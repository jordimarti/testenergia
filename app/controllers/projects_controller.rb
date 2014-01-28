class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  def index
    this_user = User.find(current_user.id)
    @projects = this_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @town = Town.find_by name: @project.town
    @simulation = Simulation.find_by construction_period: @project.construction_period, hot_water_type: @project.hot_water_type
    # Compare the simulation and the user's guess about energy class
    if @project.energy_class_guess < @simulation.energy_class
      if @project.energy_class_guess < 'e'
        @comparison = ". És poc habitual que un habitatge existent tingui una qualificació energètica per sobre de la lletra E, a no ser que s'hagi construït després del 2006. "
      else 
        @comparison = ". La qualificació energètica és pitjor del que esperàveu. "
      end
    elsif @project.energy_class_guess == @simulation.energy_class
      @comparison = ", per tant heu encertat la qualificació energètica del vostre habitatge! "
    else 
      @comparison = ". Heu estat massa pessimistes, la qualificació energètica del vostre habitatge és millor del que esperàveu. "
    end
    
    # Create suggestions for building improvement
    improve_facades = "Milloreu les façanes."
    improve_facades_img = "1981-1987.png"
    improve_windows = "Milloreu les finestres, que són obsoletes!"
    improve_windows_img = "1981-1987.png"
    improve_hot_water_type = "Escalfar aigua amb electricitat suposa una despesa d'energia important."
    improve_hot_water_type_img = "1981-1987.png"
    improve_windows_tightness = "L'estanquitat de les finestres és desitjable."
    improve_windows_tightness_img = "1981-1987.png"

    @suggestions = Array.new
    @suggestions_img = Array.new

    if @project.construction_period < '4' && @project.facade_improvements > '1'
      @suggestions.push(improve_facades)
      @suggestions_img.push(improve_facades_img)
    end
    if @project.window_type == '1' || @project.window_type == '3'
      @suggestions.push(improve_windows)
      @suggestions_img.push(improve_windows_img)
    end
    if @project.hot_water_type > '3'
      @suggestions.push(improve_hot_water_type)
      @suggestions_img.push(improve_hot_water_type_img)
    end
    if @project.window_tightness == '3'
      @suggestions.push(improve_windows_tightness)
      @suggestions_img.push(improve_windows_tightness_img)
    end
      



  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # Save the object
    if @project.save
      # If save succeeds, redirect to the index action
      #flash[:notice] = "El projecte s'ha creat correctament."
      redirect_to(:action => 'show')
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
      #flash[:notice] = "Les dades del projecte s'han gravat correctament."
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
      params.require(:project).permit(:user_id, :expert_id, :name, :town, :address, :zip_code, :construction_period, :construction_year, :project_type, :area, :facade_improvements, :roof_improvements, :window_type, :window_tightness, :hot_water_type, :hot_water_age, :heating_age, :cooling_type, :cooling_age, :lighting_type, :lighting_power, :contracted_power, :refrigerator_power, :microwave_power, :washingmachine_power, :dishwasher_power, :oven_power, :vitroceramic_power, :tv_power, :pc_power, :stereo_power, :coffeemachine_power, :electricity_consumption_january, :electricity_consumption_february, :electricity_consumption_march, :electricity_consumption_april, :electricity_consumption_may, :electricity_consumption_june, :electricity_consumption_july, :electricity_consumption_august, :electricity_consumption_september, :electricity_consumption_october, :electricity_consumption_november, :electricity_consumption_december, :gas_consumption_january, :gas_consumption_february, :gas_consumption_march, :gas_consumption_april, :gas_consumption_may, :gas_consumption_june, :gas_consumption_july, :gas_consumption_august, :gas_consumption_september, :gas_consumption_october, :gas_consumption_november, :gas_consumption_december, :gasoil_consumption_january, :gasoil_consumption_february, :gasoil_consumption_march, :gasoil_consumption_april, :gasoil_consumption_may, :gasoil_consumption_june, :gasoil_consumption_july, :gasoil_consumption_august, :gasoil_consumption_september, :gasoil_consumption_october, :gasoil_consumption_november, :gasoil_consumption_december, :other_energy_sources, :energy_class_guess, :energy_class)
    end
end
