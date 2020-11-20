require 'date'
format = '%m/%d/%y' # mm/dd/yy; adjust as needed

class BoardsController < ApplicationController
  before_action(:set_board, only: [:show])
  before_action(:set_rental, only: [:show])
  skip_before_action(:authenticate_user!, only: [ :index, :show ])
  has_scope :by_brand


  def index
    @brands = brand_list
    @boards = apply_scopes(Board).all
    if params[:query].present?
      @boards = @boards.near(params[:query],5)
    end
    @markers = @boards.geocoded.map do |board|
      {
        lat: board.latitude,
        lng: board.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { board: board })
      }
    end
  end

  def show
    @blocked_dates = @board.rentals.each_with_object([]) do |rental, result|
      result << (rental.start_date..rental.end_date).to_a
    end.flatten
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.price_per_day *= 100 if @board.price_per_day.present?
    @user = current_user

    @board.user = @user

    if @board.save
      redirect_to board_path(@board), notice: "Board added !"
    else
      render :new
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def brand_list
    brands = []
    Board.all.each do |board|
      brands << board.brand
    end
    brands.uniq
  end

  def board_params
    params.require(:board).permit(:description, :user_id, :location, :height, :volume, :brand, :condition, :price_per_day, :title, :photo)
  end

  def set_rental
    @rental = Rental.new
  end
end
