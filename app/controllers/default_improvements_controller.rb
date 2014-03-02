class DefaultImprovementsController < ApplicationController
  def index
  	@default_improvements = DefaultImprovement.find(:all)
  	@xproject = Xproject.find(params[:xproject_id])
  end
end
