class AutotestController < ApplicationController

  def index
  	@active_autotest = 'active'
  end

	def new
		@autotest = Autotest.new
  end

  def create
  	@autotest = Autotest.new(autotest_params)
    # Save the object
    if @autotest.save
      # If save succeeds, redirect to the index action
      #flash[:notice] = "El projecte s'ha creat correctament."
      redirect_to(:action => 'show', :id => @autotest.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def show
  	@autotest = Autotest.find(params[:id])
    @town = Town.find_by name: @autotest.building_town
    @simulation = Simulation.find_by construction_period: @autotest.construction_period, hot_water_type: @autotest.hot_water_type
    # Compare the simulation and the user's guess about energy class
    if @simulation && @autotest.energy_class_guess != '0'
      if @autotest.energy_class_guess < @simulation.energy_class
        if @autotest.energy_class_guess < 'e'
          @simulation_result = "La qualificació energètica del vostre habitatge és " + @simulation.energy_class.upcase + ". Havíeu suposat que sortiria una " + @autotest.energy_class_guess.upcase + ", però és poc habitual que un habitatge existent tingui una qualificació energètica per sobre de la lletra E, a no ser que s'hagi construït després del 2006. "
        else 
          @simulation_result = "La qualificació energètica del vostre habitatge és " + @simulation.energy_class.upcase + ". Havíeu suposat que sortiria una " + @autotest.energy_class_guess.upcase + ", però la qualificació energètica és pitjor del que esperàveu. Feu realitat les propostes de millora per aconseguir tenir un habitatge de baix consum energètic."
        end
      elsif @autotest.energy_class_guess == @simulation.energy_class
        @simulation_result = "La qualificació energètica del vostre habitatge és " + @simulation.energy_class.upcase + ", per tant heu encertat la qualificació energètica! Feu realitat les propostes de millora per aconseguir tenir un habitatge de baix consum energètic."
      else 
        @simulation_result = "La qualificació energètica del vostre habitatge és " + @simulation.energy_class.upcase + ". Heu estat massa pessimistes, la qualificació energètica és millor del que esperàveu! Això no vol dir que no calgui millorar l'edifici. Feu realitat les propostes de millora per aconseguir tenir un habitatge de baix consum energètic."
      end
    elsif @simulation && @autotest.energy_class_guess == '0'
      @simulation_result = "La qualificació energètica del vostre habitatge és " + @simulation.energy_class.upcase + ". Feu realitat les propostes de millora per aconseguir tenir un habitatge de baix consum energètic."
    end
  end

  private
    def autotest_params
      params.require(:autotest).permit(:building_town, :construction_period, :construction_year, :project_type, :facade_improvements, :roof_improvements, :window_type, :window_tightness, :hot_water_type, :hot_water_age, :heating_age, :cooling_type, :cooling_age, :lighting_type, :energy_class_guess)
    end
end
