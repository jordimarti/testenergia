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
    render layout: "print_layout"
  end
end
