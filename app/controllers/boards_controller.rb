class BoardsController < ApplicationController
before_action(:set_board, only: [:show])

def index
  @boards = Board.all
end

def show
end

def new
  @board = Board.new
end

def create
  @board = Board.new(board_params)

  if @board.save
    redirect_to board_path(board), notice: "Board added !"
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

end
