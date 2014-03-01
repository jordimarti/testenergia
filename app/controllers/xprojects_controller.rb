class XprojectsController < ApplicationController
  before_filter :authenticate_expert!

  def index
    this_expert = Expert.find(current_expert.id)
    @xprojects = this_expert.xprojects
  end

  def show
    @xproject = Xproject.find(params[:id])
    @improvements = @xproject.improvements
  end

  def print
    @xproject = Xproject.find(params[:id])
    @improvements = @xproject.improvements
    @consum_calefaccio = @xproject.total_energy_consumption * @xproject.heating_percentage / 100
    @consum_refrigeracio = @xproject.total_energy_consumption * @xproject.cooling_percentage / 100
    @consum_acs = @xproject.total_energy_consumption * @xproject.hot_water_percentage / 100
    @consum_iluminacio = @xproject.total_energy_consumption * @xproject.lighting_percentage / 100
    @consum_electrodomestics = @xproject.total_energy_consumption * @xproject.appliances_percentage / 100
    render layout: "print_layout"
  end

  def new
    @xproject = Xproject.new
    
    @building_systems_year = '1970'
    #Remove the last number of the year and add a zero, as in database we are storing decades
    @building_systems_decade = @building_systems_year[0..-2]+'0'
    #@building_systems = BuildingSystem.select('system_type, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0').order('y'+@building_systems_decade+' DESC')
    @building_single_sheet_walls = BuildingSystem.select('score, name, thickness, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Paret un full\'').order('y'+@building_systems_decade+' DESC')
    @building_double_sheet_walls = BuildingSystem.select('score, name, thickness, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Paret de doble full\'').order('y'+@building_systems_decade+' DESC')
    @building_flat_roof = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Coberta plana\'').order('y'+@building_systems_decade+' DESC')
    @building_slanted_roof = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Coberta inclinada\'').order('y'+@building_systems_decade+' DESC')
    @building_floor = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Terra\'').order('y'+@building_systems_decade+' DESC')
  end

  def create
    @xproject = Xproject.new(xproject_params)
    # Save the object
    if @xproject.save
      # If save succeeds, redirect to the index action
      #flash[:notice] = "El projecte s'ha creat correctament."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def create_from_project
    @xproject = Xproject.new(xproject_params)
    # Save the object
    if @xproject.save
      # If save succeeds, redirect to the index action
      #flash[:notice] = "El projecte s'ha creat correctament."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @xproject = Xproject.find(params[:id])
    if @xproject.user_id
      @user = User.find(@xproject.user_id)
    end
    @building_systems_year = @xproject.construction_year
    #Remove the last number of the year and add a zero, as in database we are storing decades
    @building_systems_decade = @building_systems_year[0..-2]+'0'
    #@building_systems = BuildingSystem.select('system_type, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0').order('y'+@building_systems_decade+' DESC')
    @building_single_sheet_walls = BuildingSystem.select('score, name, thickness, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Paret un full\'').order('y'+@building_systems_decade+' DESC')
    @building_double_sheet_walls = BuildingSystem.select('score, name, thickness, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Paret de doble full\'').order('y'+@building_systems_decade+' DESC')
    @building_flat_roof = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Coberta plana\'').order('y'+@building_systems_decade+' DESC')
    @building_slanted_roof = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Coberta inclinada\'').order('y'+@building_systems_decade+' DESC')
    @building_floor = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Terra\'').order('y'+@building_systems_decade+' DESC')
  end

  def update
    # Find an existing object using form parameters
    @xproject = Xproject.find(params[:id])
    # Update the object
    if @xproject.update_attributes(xproject_params)
      # If save succeeds, redirect to the index action
      #flash[:notice] = "Les dades del projecte s'han gravat correctament."
      redirect_to(:action => 'edit', :id => @xproject.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @xproject = Xproject.find(params[:id])
  end

  def destroy
    xproject = Xproject.find(params[:id]).destroy
    #flash[:notice] = "El projecte '#{xproject.name}' ha estat correctament eliminat."
    redirect_to(:action => 'index')
  end

  def create_improvement
    @improvement = Improvement.new(improvement_params)
    @improvement.save
  end

  def write_file
    xproject = Xproject.find(params[:id])
    #client_id = xproject.user_id
    #client = User.find(client_id)

    File.atomic_write('cex/arxiu'+params[:id]+'.cex') do |file|
      cex_file = "S'CEXv1.1 Residencial'
p0
.(lp0
V" + xproject.name + "
p1
aV" + xproject.building_road_name + ", " + xproject.building_address_number + "
p2
aVBarcelona 
p3
aVBarcelona
p4
aV
p5
aV" + xproject.user_first_name + " " + xproject.user_surname1 + " " + xproject.user_surname2 + "
p6
ag5
aVDirecció client
p7
aV935535450
p8
aVjordimarti@me.com
p9
aVRaó social
p10
aVNom del tècnic
p11
aV670410706
p12
aVjordi.marti@apabcn.cat
p13
aV08010
p14
aV1111111909
p15
aVBarcelona
p16
aVBarcelona
p17
aV08010
p18
aV36531630
p19
aVB40145
p20
aVDirecció tècnic
p21
aVBarcelona
p22
aVBarcelona
p23
aV08010
p24
aVArquitecte Tècnic
p25
a.(lp0
V
p1
ag1
aVBarcelona
p2
aVBarcelona 
p3
aVC2
p4
aVII
p5
ag1
aV2.7
p6
ag1
aV0
p7
aVMedia
p8
aI00
ag1
a(lp9
I00
ag1
ag1
aaI00
aS'W'
p10
a(lp11
I01
aI00
aI00
aaS''
p12
ag12
ag1
ag1
a.(lp0
(lp1
a(lp2
a(lp3
a(lp4
a.(lp0
(lp1
a(lp2
a(lp3
a(lp4
a(lp5
a(lp6
a(lp7
a(lp8
a(lp9
a(lp10
a(lp11
a(lp12
a.(lp0
.(lp0
(lp1
a(lp2
V
p3
ag3
ag3
ag3
ag3
ag3
ag3
ag3
ag3
ag3
aa(lp4
a(lp5
(lp6
a(lp7
aa.(lp0
.(lp0
.(lp0
.(lp0
S'Sin patrón'
p1
a.(lp0
."
      cex_file_encoded = cex_file.encode("ISO-8859-1")
      file.write(cex_file_encoded)
    end
    file_path = 'cex/arxiu'+params[:id]+'.cex'
    send_file file_path, :type=>'text/cex'
  end

  


  private
    def xproject_params
      params.require(:xproject).permit(:user_id, :expert_id, :name, :building_address, :building_zip_code, :building_town, :cadastre, :construction_period, :construction_year, :project_type, :area, :facade_improvements, :roof_improvements, :window_type, :window_tightness, :facade_definition, :facade_score, :roof_definition, :roof_score, :floor_definition, :floor_score, :windows_definition, :windows_score, :hot_water_type, :hot_water_age, :heating_age, :cooling_type, :cooling_age, :lighting_type, :lighting_power, :contracted_power, :hot_water_definition, :hot_water_score, :heating_definition, :heating_score, :cooling_definition, :cooling_score, :lighting_definition, :lighting_score, :appliances_definition, :appliances_score, :electricity_consumption_january, :electricity_consumption_february, :electricity_consumption_march, :electricity_consumption_april, :electricity_consumption_may, :electricity_consumption_june, :electricity_consumption_july, :electricity_consumption_august, :electricity_consumption_september, :electricity_consumption_october, :electricity_consumption_november, :electricity_consumption_december, :gas_consumption_january, :gas_consumption_february, :gas_consumption_march, :gas_consumption_april, :gas_consumption_may, :gas_consumption_june, :gas_consumption_july, :gas_consumption_august, :gas_consumption_september, :gas_consumption_october, :gas_consumption_november, :gas_consumption_december, :gasoil_consumption_january, :gasoil_consumption_february, :gasoil_consumption_march, :gasoil_consumption_april, :gasoil_consumption_may, :gasoil_consumption_june, :gasoil_consumption_july, :gasoil_consumption_august, :gasoil_consumption_september, :gasoil_consumption_october, :gasoil_consumption_november, :gasoil_consumption_december, :other_energy_sources, :energy_class_guess, :energy_class, :user_first_name, :user_surname1, :user_surname2, :user_id_document_type, :user_id_document_number, :user_telephone, :user_mobile_phone, :user_email, :user_address, :user_zip_code, :user_town, :global_emissions, :global_emissions_rating, :global_primary_energy, :global_primary_energy_rating, :total_energy_consumption, :total_energy_consumption_improvements, :heating_percentage, :cooling_percentage, :hot_water_percentage, :lighting_percentage, :appliances_percentage)
    end
end
