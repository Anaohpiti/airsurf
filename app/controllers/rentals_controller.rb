class RentalsController < ApplicationController
  # red !! routes and model need to be updated to reflect these actions
  before_action(:set_rental, only: [:show, :approve, :deny])


  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
    rental = Rental.create(rental_params)
    # yellow redirect to rentals index
    redirect_to rentals_path(rental)
  end

  def deny
    @rental.status = "denied"
    @rental.update(rental_params)
    # yellow redirect to rentals index
    redirect_to rentals_path(rental)
  end

  def approve
    @rental.status = "approved"
    @rental.update(rental_params)
    # yellow redirect to rentals index
    redirect_to rentals_path(rental)
  end

  # yellow i think EDIT and UPDATE not required
  # def edit
  # end

  # def update
  #   @rental.update(rental_params)

  #   redirect_to rental_path(@rental)
  # end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  # Strong Params
  def rental_params
    # ####################################################bl####################yellow :status not required strong params #########
    params.require(:rental).permit(:board_id, :user_id, :start_date, :end_date, :status, :total_price)
  end
end
