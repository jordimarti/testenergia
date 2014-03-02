class ImprovementsController < ApplicationController
  before_filter :authenticate_expert!
  def index
    @xproject = Xproject.find(params[:id])
    @improvements = @xproject.improvements
  end

  def new
    @xproject = Xproject.find(params[:xproject_id])
    @improvement = Improvement.new
  end

  def create
    @improvement = Improvement.new(improvement_params)
    # Save the object
    if @improvement.save
      # If save succeeds, redirect to the index action
      #flash[:notice] = "La nova proposta de millora s'ha creat correctament."
      redirect_to(:action => 'index/'+@improvement.xproject_id.to_s)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @xproject = Xproject.find(params[:xproject_id])
    @improvement = Improvement.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @improvement = Improvement.find(params[:id])
    # Update the object
    if @improvement.update_attributes(improvement_params)
      # If save succeeds, redirect to the index action
      #flash[:notice] = "Les dades de la proposta de millora s'han gravat correctament."
      redirect_to(:action => 'index/'+@improvement.xproject_id.to_s)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @improvement = Improvement.find(params[:id])
  end

  def destroy
    @improvement = Improvement.find(params[:id]).destroy
    flash[:notice] = "Proposta eliminada correctament."
    redirect_to(:action => 'index/'+@improvement.xproject_id.to_s)
  end

  def create_from_default
    # Creates an improvement from a default improvement 
    @default_improvement = DefaultImprovement.find(params[:id])
    @xproject = Xproject.find(params[:xproject_id])
    @improvement = Improvement.new()
    if @improvement.update_attributes(
      :xproject_id => @xproject.id, 
      :name => @default_improvement.name,
      :description => @default_improvement.description,
      :cost => @default_improvement.cost,
      :energy_savings => @default_improvement.energy_savings,
      :emissions_savings => @default_improvement.emissions_savings,
      :roi => @default_improvement.roi
      )
      flash[:notice] = "Proposta creada a partir de llibreria."
      redirect_to(:action => 'index', :id => @xproject.id)
    else
      render('new')
    end
  end

  private
    def improvement_params
      params.require(:improvement).permit(:xproject_id, :name, :description, :measure_type, :cost, :energy_savings, :emissions_savings, :economic_savings, :roi, :difficulty, :better_comfort, :better_healthiness, :better_security, :less_noise, :less_airflow, :less_moisture, :less_maintenance, :water_savings)
    end
end
