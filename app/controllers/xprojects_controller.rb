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
    @expert = Expert.find(current_expert.id)
    @improvements = @xproject.improvements
    @total_energy_consumption = @xproject.electricity_consumption + @xproject.gas_consumption + @xproject.gasoil_consumption
    @total_energy_consumption_improvements = @xproject.electricity_consumption_improvements + @xproject.gas_consumption_improvements + @xproject.gasoil_consumption_improvements
    @consum_calefaccio = @total_energy_consumption * @xproject.heating_percentage / 100
    @consum_refrigeracio = @total_energy_consumption * @xproject.cooling_percentage / 100
    @consum_acs = @total_energy_consumption * @xproject.hot_water_percentage / 100
    @consum_iluminacio = @total_energy_consumption * @xproject.lighting_percentage / 100
    @consum_electrodomestics = @total_energy_consumption * @xproject.appliances_percentage / 100
    
    @indicador_emissions_calefaccio = emissions_calculator @xproject.heating_energy_source, @xproject.id
    @indicador_costos_calefaccio = costos_calculator @xproject.heating_energy_source, @xproject.id
    @emissions_calefaccio = @consum_calefaccio * @indicador_emissions_calefaccio
    @cost_calefaccio = @consum_calefaccio * @indicador_costos_calefaccio
    @valoracio_calefaccio = valoracio_consum 'calefaccio', @consum_calefaccio, @xproject.id
    
    @indicador_emissions_refrigeracio = emissions_calculator @xproject.cooling_energy_source, @xproject.id
    @indicador_costos_refrigeracio = costos_calculator @xproject.cooling_energy_source, @xproject.id
    @emissions_refrigeracio = @consum_refrigeracio * @indicador_emissions_refrigeracio
    @cost_refrigeracio = @consum_refrigeracio * @indicador_costos_refrigeracio
    @valoracio_refrigeracio = valoracio_consum 'refrigeracio', @consum_refrigeracio, @xproject.id
    
    @indicador_emissions_acs = emissions_calculator @xproject.hot_water_energy_source, @xproject.id
    @indicador_costos_acs = costos_calculator @xproject.hot_water_energy_source, @xproject.id
    @emissions_acs = @consum_acs * @indicador_emissions_acs
    @cost_acs = @consum_acs * @indicador_costos_acs
    @valoracio_acs = valoracio_consum 'acs', @consum_acs, @xproject.id

    @indicador_emissions_iluminacio = emissions_calculator @xproject.hot_water_energy_source, @xproject.id
    @indicador_costos_iluminacio = costos_calculator @xproject.hot_water_energy_source, @xproject.id
    @emissions_iluminacio = @consum_iluminacio * @indicador_emissions_iluminacio
    @cost_iluminacio = @consum_iluminacio * @indicador_costos_iluminacio
    @valoracio_iluminacio = valoracio_consum 'iluminacio', @consum_iluminacio, @xproject.id

    @indicador_emissions_electrodomestics = emissions_calculator @xproject.hot_water_energy_source, @xproject.id
    @indicador_costos_electrodomestics = costos_calculator @xproject.hot_water_energy_source, @xproject.id
    @emissions_electrodomestics = @consum_electrodomestics * @indicador_emissions_electrodomestics
    @cost_electrodomestics = @consum_electrodomestics * @indicador_costos_electrodomestics
    @valoracio_electrodomestics = valoracio_consum 'electrodomestics', @consum_electrodomestics, @xproject.id

    render layout: "print_layout"
  end

  #Method to calculate emissions for the report above
  def emissions_calculator(energy_source, xproject_id)
    @xproject = Xproject.find(xproject_id)
    case energy_source
      when 1
        emissions = @xproject.electricity_emissions
      when 2
        emissions = @xproject.gas_emissions
      when 3
        emissions = @xproject.gasoil_emissions
      else
        emissions = 0
    end
    return emissions
  end

  #Method to calculate cost for the report above
  def costos_calculator(energy_source, xproject_id)
    @xproject = Xproject.find(xproject_id)
    case energy_source
      when 1
        cost = @xproject.electricity_price
      when 2
        cost = @xproject.gas_price
      when 3
        cost = @xproject.gasoil_price
      else
        cost = 0
    end
    return cost
  end

  #Method to evaluate energy consumption
  def valoracio_consum(element, energy_consumption, xproject_id)
    @xproject = Xproject.find(xproject_id)
    indicador_consum = energy_consumption / @xproject.area
    case element
      when 'calefaccio'
        menor_consum_edifici = 27
        molt_menor_consum_edifici = 20
        major_consum_edifici = 33
        molt_major_consum_edifici = 40
        menor_consum_casa = 77
        molt_menor_consum_casa = 50
        major_consum_casa = 89
        molt_major_consum_casa = 116
      when 'refrigeracio'
        menor_consum_edifici = 1
        molt_menor_consum_edifici = 0
        major_consum_edifici = 3
        molt_major_consum_edifici = 5
        menor_consum_casa = 1
        molt_menor_consum_casa = 0
        major_consum_casa = 3
        molt_major_consum_casa = 5
      when 'acs'
        menor_consum_edifici = 19
        molt_menor_consum_edifici = 12
        major_consum_edifici = 25
        molt_major_consum_edifici = 32
        menor_consum_casa = 10
        molt_menor_consum_casa = 7
        major_consum_casa = 15
        molt_major_consum_casa = 20
      when 'iluminacio'
        menor_consum_edifici = 3.5
        molt_menor_consum_edifici = 2
        major_consum_edifici = 6
        molt_major_consum_edifici = 8
        menor_consum_casa = 2.8
        molt_menor_consum_casa = 2
        major_consum_casa = 3.8
        molt_major_consum_casa = 5
      when 'electrodomestics'
        menor_consum_edifici = 26
        molt_menor_consum_edifici = 20
        major_consum_edifici = 34
        molt_major_consum_edifici = 40
        menor_consum_casa = 22
        molt_menor_consum_casa = 18
        major_consum_casa = 28
        molt_major_consum_casa = 32
      
    end
    #The project is a building or flat
    if @xproject.project_type != 2
      if indicador_consum < menor_consum_edifici
        if indicador_consum < molt_menor_consum_edifici
          valoracio = -2
        elsif
          valoracio = -1
        end
      end
      if indicador_consum >= menor_consum_edifici && indicador_consum <= major_consum_edifici
        valoracio = 0
      end
      if indicador_consum > major_consum_edifici
        if indicador_consum > molt_major_consum_edifici
          valoracio = 2
        elsif
          valoracio = 1
        end
      end
      if indicador_consum == 0
        valoracio = 0
      end
    #The project is a house
    elsif @xproject.project_type == 2
      if indicador_consum < menor_consum_casa
        if indicador_consum < molt_menor_consum_casa
          valoracio = -2
        elsif
          valoracio = -1
        end
      end
      if indicador_consum >= menor_consum_casa && indicador_consum <= major_consum_casa
        valoracio = 0
      end
      if indicador_consum > major_consum_casa
        if indicador_consum > molt_major_consum_casa
          valoracio = 2
        elsif
          valoracio = 1
        end
      end
      if indicador_consum == 0
        valoracio = 0
      end
    end

    return valoracio
  end

  def print_pdf
    File.open("test_energia.pdf", "w+b") do |f|
      f.write DocRaptor.create(:document_url => "http://fierce-garden-4895.herokuapp.com/report/print/1",
        :name             => "test_energia.pdf",
        :document_type    => "pdf",
        :strict           => "none",
        :test             => true)
    end
    send_file "test_energia.pdf"
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
aV" + xproject.building_address + "
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
      params.require(:xproject).permit(:user_id, :expert_id, :name, :building_address, :building_zip_code, :building_town, :cadastre, :construction_period, :construction_year, :project_type, :area, :facade_improvements, :roof_improvements, :window_type, :window_tightness, :facade_definition, :facade_score, :roof_definition, :roof_score, :floor_definition, :floor_score, :windows_definition, :windows_score, :hot_water_type, :hot_water_age, :heating_age, :cooling_type, :cooling_age, :lighting_type, :lighting_power, :contracted_power, :hot_water_definition, :hot_water_score, :heating_definition, :heating_score, :cooling_definition, :cooling_score, :lighting_definition, :lighting_score, :appliances_definition, :appliances_score, :electricity_consumption, :electricity_price, :electricity_emissions, :electricity_consumption_improvements, :gas_consumption, :gas_price, :gas_emissions, :gas_consumption_improvements, :gasoil_consumption, :gasoil_price, :gasoil_emissions, :gasoil_consumption_improvements, :other_energy_sources, :energy_class_guess, :energy_class, :user_first_name, :user_surname1, :user_surname2, :user_id_document_type, :user_id_document_number, :user_telephone, :user_mobile_phone, :user_email, :user_address, :user_zip_code, :user_town, :global_emissions, :global_emissions_rating, :global_primary_energy, :global_primary_energy_rating, :total_energy_consumption, :total_energy_consumption_improvements, :heating_percentage, :heating_energy_source, :cooling_percentage, :cooling_energy_source, :hot_water_percentage, :hot_water_energy_source, :lighting_percentage, :appliances_percentage)
    end
end
