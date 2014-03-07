class DefaultImprovementsController < ApplicationController
  def index
  	@default_improvements_c1 = DefaultImprovement.where(:category => 1)
  	@default_improvements_c2 = DefaultImprovement.where(:category => 2)
  	@default_improvements_c3 = DefaultImprovement.where(:category => 3)
  	@default_improvements_c4 = DefaultImprovement.where(:category => 4)
  	@default_improvements_c5 = DefaultImprovement.where(:category => 5)
  	@default_improvements_c6 = DefaultImprovement.where(:category => 6)
  	@default_improvements_c7 = DefaultImprovement.where(:category => 7)
  	@default_improvements_c8 = DefaultImprovement.where(:category => 8)

  	@xproject = Xproject.find(params[:xproject_id])

  	if @xproject.facade_score < 3
  		@automeasure_insulate_facade_message = "El nivell d'aïllament de les façanes és baix:"
  		@automeasure_insulate_facade = DefaultImprovement.find(1)
  	end

  	if @xproject.roof_score > 0 && @xproject.roof_score < 3
  		@automeasure_insulate_roof_message = "El nivell d'aïllament de la coberta és baix:"
  		@automeasure_insulate_roof = DefaultImprovement.find(5)
  	end

  	if @xproject.hot_water_score > 0 && @xproject.hot_water_score < 3
  		@automeasure_hot_water_message = "El sistema per escalfar aigua és deficient:"
  		@automeasure_hot_water = DefaultImprovement.find(15)
  	end

  end
end
