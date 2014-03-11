class ReportController < ApplicationController
  #Creates the PDF report. It should be in xprojects, but as it requires authentication and this must be sent to Docraptor, I placed it here
  def print
    @xproject = Xproject.find(params[:id])
    @expert = Expert.find(@xproject.expert_id)
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
end
