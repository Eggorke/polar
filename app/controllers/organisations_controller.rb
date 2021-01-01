class OrganisationsController < ApplicationController
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
      redirect_to organisations_path
    end
  end

  def edit
    @organisation = Organisation.find_by(id: params[:id])
  end

  def destroy
    @organisation = Organisation.find_by(id: params[:id])
    if @organisation.delete
      redirect_to organisations_path
    end
  end

  def update
    @organisation = Organisation.find_by(id: params[:id])
    if @organisation.update(organisation_params)
      redirect_to organisations_path
    end
  end


end


private

def organisation_params
  params.require(:organisation).permit(:name, :phone, :director, :note)
end