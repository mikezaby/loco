class BoardsController < ApplicationController
  def index
    api_response(boards)
  end

  def show
    api_response(board)
  end

  def create
    api_response(board) { board.save! }
  end

  def update
    api_response(board) { board.update!(board_params) }
  end

  def destroy
    api_response(board, status: 204, error_status: 409) { board.destroy! }
  end

  private

  def board
    @board ||= if action_name == "create"
      Board.new(board_params)
    else
      Board.find(params[:id])
    end
  end

  def boards
    @boards ||= Board.all
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
