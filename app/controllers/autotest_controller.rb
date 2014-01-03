class AutotestController < ApplicationController
  
  before_filter :authenticate_user!

  def index
  	@active_autotest = 'active'
  end

	def dades_generals

  end
end
