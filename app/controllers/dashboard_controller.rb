class DashboardController < ApplicationController

	before_filter :authenticate_expert!

	def index
    this_expert = Expert.find(current_expert.id)
    @users = this_expert.users
  end

  def show
    @user = User.find(params[:id])
  end

end