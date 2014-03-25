class AdminController < ApplicationController
  def index
  	@experts = Expert.find(:all, :order => "id")
  	@xprojects = Xproject.find(:all)
  	#@unassigned_xprojects = Xproject.where(:expert_id => nil)
  end

  def show
  	@expert = Expert.find(params[:id])
  end

  def edit
  	@expert = Expert.find(params[:id])
  end

  def update
  	@expert = Expert.find(params[:id])
  	if @expert.update_attributes(expert_params)
      redirect_to(:action => 'show', :id => @expert.id)
    else
      render('edit')
    end
  end

  private
    def expert_params
      params.require(:expert).permit(:expert_id, :expert_first_name, :expert_surname1, :expert_surname2, :expert_id_document_type, :expert_id_document_number, :expert_telephone, :expert_mobile_phone, :expert_address, :expert_zip_code, :expert_town, :expert_province, :title, :referee_number)
    end

end
