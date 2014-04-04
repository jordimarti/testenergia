class ExpertController < ApplicationController
  before_filter :authenticate_expert!

  def index
  	@expert = Expert.find(current_expert.id)
    @xprojects = @expert.xprojects
  end

  def show_personal_data
  	@expert = Expert.find(current_expert.id)
  end

  def edit_personal_data
  	@expert = Expert.find(current_expert.id)
  end

  def update_personal_data
  	@expert = Expert.find(current_expert.id)
  	if @expert.update_attributes(expert_params)
      redirect_to(:action => 'show_personal_data', :id => @expert.id)
    else
      render('edit_personal_data')
    end
  end

  private
    def expert_params
      params.require(:expert).permit(:expert_id, :expert_first_name, :expert_surname1, :expert_surname2, :expert_id_document_type, :expert_id_document_number, :expert_telephone, :expert_mobile_phone, :expert_address, :expert_zip_code, :expert_town, :expert_province, :title, :referee_number)
    end
end
