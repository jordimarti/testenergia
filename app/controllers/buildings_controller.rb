class BuildingsController < ApplicationController
  before_filter :authenticate_user!
  def index
    this_user = User.find(current_user.id)
    @buildings = this_user.buildings
    #@buildings = Building.order("id ASC")
  end

  def show
    @building = Building.find(params[:id])
  end

  def new
    @building = Building.new
  end

  def create
    # Instantiate a new object using form parameters
    @building = Building.new(building_params)
    # Save the object
    if @building.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "L'edifici s'ha creat correctament."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @building = Building.find(params[:id])
    # Update the object
    if @building.update_attributes(building_params)
      # If save succeeds, redirect to the index action
      flash[:notice] = "Les dades de l'edifici s'han gravat correctament."
      redirect_to(:action => 'show', :id => @building.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @building = Building.find(params[:id])
  end

  def destroy
    building = Building.find(params[:id]).destroy
    flash[:notice] = "L'edifici '#{building.name}' ha estat correctament eliminat."
    redirect_to(:action => 'index')
  end

  private
    def building_params
      params.require(:building).permit(:name, :area, :user_id)
    end
end
