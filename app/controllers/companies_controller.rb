class CompaniesController < ApplicationController
  def new
  	@company = Company.new
  end

  def create 
  	@company = Company.new(company_params)

  	if (@company.save)
  	  redirect_to root_path, notice: "Company was successfullt saved."
  	else
  	  render action: "new"
  	end
  end

  private 
    def company_params
    	params.require(:company).permit(:name, :email, :password, :password_confirmation)
    end
end
