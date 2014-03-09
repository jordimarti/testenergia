class ReportController < ApplicationController
  #Creates the PDF report. It should be in xprojects, but as it requires authentication and this must be sent to Docraptor, I placed it here
  def print
    @xproject = Xproject.find(params[:id])
    @improvements = @xproject.improvements
    @consum_calefaccio = @xproject.total_energy_consumption * @xproject.heating_percentage / 100
    @consum_refrigeracio = @xproject.total_energy_consumption * @xproject.cooling_percentage / 100
    @consum_acs = @xproject.total_energy_consumption * @xproject.hot_water_percentage / 100
    @consum_iluminacio = @xproject.total_energy_consumption * @xproject.lighting_percentage / 100
    @consum_electrodomestics = @xproject.total_energy_consumption * @xproject.appliances_percentage / 100
    render layout: "report_layout"
  end
end
