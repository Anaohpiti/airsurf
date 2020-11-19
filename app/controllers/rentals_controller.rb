class RentalsController < ApplicationController
  # red !! routes and model need to be updated to reflect these actions
  before_action(:set_rental, only: [:show, :approve, :deny])
  before_action(:set_board, only: [:new, :create, :index])

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.board = @board
    @rental.user = current_user
    # yellow redirect to rentals index

    duration = (@rental.end_date - @rental.start_date).to_i
    @rental.total_price = (@rental.board.price_per_day * duration) / 100
    if @rental.save!
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

  def deny
    @rental.status = "denied"
    @rental.save
    # yellow redirect to rentals index
    redirect_to profile_path
  end

  def approve
    @rental.status = "approved"
    @rental.save
    # yellow redirect to rentals index
    redirect_to profile_path
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

  def set_board
    @board = Board.find(params[:board_id])
  end
end
