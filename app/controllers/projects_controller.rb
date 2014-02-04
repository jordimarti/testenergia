class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  def index
    this_user = User.find(current_user.id)
    @projects = this_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @town = Town.find_by name: @project.building_town
    @simulation = Simulation.find_by construction_period: @project.construction_period, hot_water_type: @project.hot_water_type
    # Compare the simulation and the user's guess about energy class
    if @simulation && @project.energy_class_guess != '0'
      if @project.energy_class_guess < @simulation.energy_class
        if @project.energy_class_guess < 'e'
          @simulation_result = "La qualificació energètica del vostre habitatge és " + @simulation.energy_class.upcase + ". Havíeu suposat que sortiria una " + @project.energy_class_guess.upcase + ", però és poc habitual que un habitatge existent tingui una qualificació energètica per sobre de la lletra E, a no ser que s'hagi construït després del 2006. "
        else 
          @simulation_result = "La qualificació energètica del vostre habitatge és " + @simulation.energy_class.upcase + ". Havíeu suposat que sortiria una " + @project.energy_class_guess.upcase + ", però la qualificació energètica és pitjor del que esperàveu. Feu realitat les propostes de millora per aconseguir tenir un habitatge de baix consum energètic."
        end
      elsif @project.energy_class_guess == @simulation.energy_class
        @simulation_result = "La qualificació energètica del vostre habitatge és " + @simulation.energy_class.upcase + ", per tant heu encertat la qualificació energètica! Feu realitat les propostes de millora per aconseguir tenir un habitatge de baix consum energètic."
      else 
        @simulation_result = "La qualificació energètica del vostre habitatge és " + @simulation.energy_class.upcase + ". Heu estat massa pessimistes, la qualificació energètica és millor del que esperàveu! Això no vol dir que no calgui millorar l'edifici. Feu realitat les propostes de millora per aconseguir tenir un habitatge de baix consum energètic."
      end
    elsif @simulation && @project.energy_class_guess == '0'
      @simulation_result = "La qualificació energètica del vostre habitatge és " + @simulation.energy_class.upcase + ". Feu realitat les propostes de millora per aconseguir tenir un habitatge de baix consum energètic."
    end
    
    # Create suggestions for building improvement
    improve_global_insulation = "És molt probable que el vostre habitatge tingui un nivell d'aïllement tèrmic baix. Millorar l'aïllament de façanes i cobertes pot arribar a suposar un estalvi energètic de més del 30% en calefacció i refrigeració. A més tenir un habitatge ben aïllat incrementa el confort tèrmic i acústic."
    improve_global_insulation_title = "Millora de l'aïllament de façanes i cobertes"
    improve_global_insulation_img = "global_insulation.png"
    improve_facades = "Si milloreu les prestacions tèrmiques de les façanes obtindreu un estalvi de fins el 30% del consum. Encara que un habitatge estigui a 20ºC pot ser que els seus habitants passin fred perquè les parets són fredes, per tant aïllar no és tan sols una qüestió d'estalvi energètic sinó de millora del confort tèrmic i acústic."
    improve_facades_title = "Millora de l'aïllament de façanes"
    improve_facades_img = "1988-2006.png"
    improve_roof = "Tenir un bon aïllament de coberta és una de les accions clau per evitar el fred a l'hivern i la calor a l'estiu. En alguns casos incrementar el nivell d'aïllament de la coberta pot resultar molt senzill i econòmic. És recomanable que us informeu d'aquesta possibilitat perquè podríeu arribar a estalviar un 20% del consum en climatització i a més incrementar el vostre confort a la llar."
    improve_roof_title = "Millora de l'aïllament de coberta"
    improve_roof_img = "roof.png"
    improve_windows_tightness = "Les finestres són un element de la façana que ens proporciona llum i ventilació, però també és un dels punts més febles des del punt de vista energètic. Podeu perdre entre un 10 i un 20% de l'energia invertida en climatitzar si les finestres estan en mal estat. Reparar les finestres o afegir ribets de goma us permetrà reduir les infiltracions d'aire i les pèrdues energètiques."
    improve_windows_tightness_title = "Millora de l'estanquitat de les finestres"
    improve_windows_tightness_img = "tightened_windows.png"
    improve_windows = "Les finestres són el punt més feble de la façana. En el vostre cas podríeu notar una gran millora en el confort tèrmic i acústic si canvieu les finestres amb vidre senzill per finestres amb vidre doble i fusteries de millor qualitat. L'estalvi energètic que suposaria aquest canvi pot arribar a ser del 20%."
    improve_windows_title = "Canvi de finestres"
    improve_windows_img = "new_windows.png"
    improve_hot_water_age = "L'equip per escalfar aigua que teniu és antic i probablement tingui un rendiment molt baix. És recomanable canviar l'equip existent per un de més alt rendiment. L'ideal és instal·lar una caldera de condensació, perquè tindrà un rendiment molt alt i us permetrà estalviar fins a un 20% d'energia respecte l'equip que teniu instal·lat actualment."
    improve_hot_water_age_title = "Renovació de caldera"
    improve_hot_water_age_img = "boiler.png"
    improve_hot_water_type = "Escalfar aigua amb electricitat suposa una despesa d'energia i diners important. Utilitzar una caldera de condensació us permetria reduir un 15% el consum d'energia per a escalfar aigua."
    improve_hot_water_type_title = "Canvi d'escalfador elèctric a caldera eficient"
    improve_hot_water_type_img = "boiler.png"
    improve_cooling_age = "Els equips d'aire condicionat antics tenen un rendiment energètic molt baix comparat amb els actuals. Tenint en compte que la vida útil que li queda a l'equip ja deu ser curta per la seva antiguitat, és recomanable substituir-lo el més aviat possible per un equip nou d'alt rendiment. Aquest canvi pot reduir més d'un 30% la despesa energètica en aire condicionat."
    improve_cooling_age_title = "Renovació de l'equip d'aire condicionat"
    improve_cooling_age_img = "cooling_machine.png"
    improve_lighting_type = "Si substituïu les bombetes actuals per bombetes de baix consum o tipus LED podreu tenir uns bons nivells d'il·luminació consumint menys energia. Actualment les bombetes eficients poden oferir una bona qualitat de llum equiparable a les incandescents o halògenes."
    improve_lighting_type_title = "Substitució de bombetes"
    improve_lighting_type_img = "light_bulb.png"

    @suggestions = Array.new
    @suggestions_title = Array.new
    @suggestions_img = Array.new

    # Facades
    if @project.construction_period < '4' && @project.facade_improvements > '1'
      if @project.construction_period < '4' && @project.roof_improvements > '1'
        @suggestions.push(improve_global_insulation)
        @suggestions_title.push(improve_global_insulation_title)
        @suggestions_img.push(improve_global_insulation_img)
      elsif
        @suggestions.push(improve_facades)
        @suggestions_title.push(improve_facades_title)
        @suggestions_img.push(improve_facades_img)
      end
    elsif @project.construction_period < '4' && @project.roof_improvements > '1'
      @suggestions.push(improve_roof)
      @suggestions_title.push(improve_roof_title)
      @suggestions_img.push(improve_roof_img)
    end
    # Windows
    if @project.window_type == '1' || @project.window_type == '3'
      @suggestions.push(improve_windows)
      @suggestions_title.push(improve_windows_title)
      @suggestions_img.push(improve_windows_img)
    elsif @project.window_tightness == '2' || @project.window_tightness == '3'
      @suggestions.push(improve_windows_tightness)
      @suggestions_title.push(improve_windows_tightness_title)
      @suggestions_img.push(improve_windows_tightness_img)
    end
    # Hot water & HVAC system
    if @project.hot_water_age == '1'
      @suggestions.push(improve_hot_water_age)
      @suggestions_title.push(improve_hot_water_age_title)
      @suggestions_img.push(improve_hot_water_age_img)
    elsif @project.hot_water_type > '3'
      @suggestions.push(improve_hot_water_type)
      @suggestions_title.push(improve_hot_water_type_title)
      @suggestions_img.push(improve_hot_water_type_img)
    elsif @project.cooling_age == '1'
      @suggestions.push(improve_cooling_age)
      @suggestions_title.push(improve_cooling_age_title)
      @suggestions_img.push(improve_cooling_age_img)
    end
    # Lighting
    if @project.lighting_type == '2' || @project.lighting_type == '3'
      @suggestions.push(improve_lighting_type)
      @suggestions_title.push(improve_lighting_type_title)
      @suggestions_img.push(improve_lighting_type_img)
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
      params.require(:project).permit(:user_id, :expert_id, :name, :building_road_type, :building_road_name, :building_address_number, :building_block, :building_stairs, :building_story, :building_door, :building_zip_code, :building_town, :construction_period, :construction_year, :project_type, :area, :facade_improvements, :roof_improvements, :window_type, :window_tightness, :hot_water_type, :hot_water_age, :heating_age, :cooling_type, :cooling_age, :lighting_type, :lighting_power, :contracted_power, :refrigerator_power, :microwave_power, :washingmachine_power, :dishwasher_power, :oven_power, :vitroceramic_power, :tv_power, :pc_power, :stereo_power, :coffeemachine_power, :electricity_consumption_january, :electricity_consumption_february, :electricity_consumption_march, :electricity_consumption_april, :electricity_consumption_may, :electricity_consumption_june, :electricity_consumption_july, :electricity_consumption_august, :electricity_consumption_september, :electricity_consumption_october, :electricity_consumption_november, :electricity_consumption_december, :gas_consumption_january, :gas_consumption_february, :gas_consumption_march, :gas_consumption_april, :gas_consumption_may, :gas_consumption_june, :gas_consumption_july, :gas_consumption_august, :gas_consumption_september, :gas_consumption_october, :gas_consumption_november, :gas_consumption_december, :gasoil_consumption_january, :gasoil_consumption_february, :gasoil_consumption_march, :gasoil_consumption_april, :gasoil_consumption_may, :gasoil_consumption_june, :gasoil_consumption_july, :gasoil_consumption_august, :gasoil_consumption_september, :gasoil_consumption_october, :gasoil_consumption_november, :gasoil_consumption_december, :other_energy_sources, :energy_class_guess, :energy_class, :user_first_name, :user_surname1, :user_surname2, :user_id_document_type, :user_id_document_number, :user_telephone, :user_mobile_phone, :user_road_type, :user_road_name, :user_address_number, :user_block, :user_stairs, :user_story, :user_door, :user_zip_code, :user_town)
    end
end
