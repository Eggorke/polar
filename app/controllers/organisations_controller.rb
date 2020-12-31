class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
  end

  def new
    @organisation = Organisation.new()
  end

  def create
    #@organisation = Organisation.new(organisation_params)
    if Organisation.create(organisation_params)
      redirect_to organisations_path
    end
  end
end


private

def organisation_params
  params.require(:organisation).permit(:name, :phone, :director, :note)
end