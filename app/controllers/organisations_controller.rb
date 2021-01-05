class OrganisationsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @organisations = Organisation.all
  end

  def new
    @organisation = Organisation.new()
  end

  def show
    @organisation = Organisation.find_by(id: params[:id])
  end

  def create
    if Organisation.create(organisation_params)
      flash[:notice] = 'Организация создана'
      redirect_to organisations_path
    end
  end

  def edit
    @organisation = Organisation.find_by(id: params[:id])
  end

  def destroy
    @organisation = Organisation.find_by(id: params[:id])
    if @organisation.delete
      flash[:danger] = 'Организация удалена'
      redirect_to organisations_path
    end
  end

  def update
    @organisation = Organisation.find_by(id: params[:id])
    if @organisation.update(organisation_params)
      flash[:notice] = 'Организация обновлена'
      redirect_to organisations_path
    end
  end


end


private

def organisation_params
  params.require(:organisation).permit(:name, :phone, :director, :note)
end