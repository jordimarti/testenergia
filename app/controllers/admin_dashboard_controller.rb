class AdminDashboardController < ApplicationController
 	
 	before_filter :authenticate_admin!

  def index
  	@experts = Expert.find(:all)
  	@xprojects = Xproject.find(:all)
  	@unassigned_xprojects = Xproject.where(:expert_id => nil)
  	
  end
end
