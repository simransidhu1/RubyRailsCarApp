class PagesController < ApplicationController
  def home
  end

  def about
  end

  def dashboard
    @customers_count = Customer.count
    @companies_count = Company.count
    @old_cars_count = OldCar.count
    @sales_count = Sale.count
  end

  def old_cars
    @companies = Company.all  # Get all companies for filtering
  
    # Search & Filter Logic
    @old_cars = OldCar.all
    @old_cars = @old_cars.where("model LIKE ?", "%#{params[:search]}%") if params[:search].present?
    @old_cars = @old_cars.where(company_id: params[:company_id]) if params[:company_id].present?
  
    @old_cars = @old_cars.page(params[:page]).per(50)  # Paginate results
  end
  



end
