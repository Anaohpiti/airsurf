class BoardsController < ApplicationController
before_action(:set_board, only: [:show])
before_action(:set_rental, only: [:show])

skip_before_action(:authenticate_user!, only: [ :index, :show ])


  def index
    if params[:query].present?
      @boards = Board.search_by_location(params[:query])
      #@boards = Board.near(params[:query],5)
    else
      @boards = Board.all
    end
  end

  def show
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


  # Strong Params
  def board_params
  # ############################################yellow### - how do we deal with user_id? - yellow #######################
    params.require(:board).permit(:description, :user_id, :location, :height, :volume, :brand, :condition, :price_per_day, :title, :photo)
  end

  def set_rental
    @rental = Rental.new
  end

end
