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

  private
    def improvement_params
      params.require(:improvement).permit(:xproject_id, :name, :description, :cost, :savings, :roi)
    end
end
