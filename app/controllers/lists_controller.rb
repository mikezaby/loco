class ListsController < ApplicationController
  def show
    api_response(list)
  end

  def create
    api_response(list) { list.save! }
  end

  def update
    api_response(list) { list.update!(list_params) }
  end

  def destroy
    api_response(list, status: 204, error_status: 409) { list.destroy! }
  end

  private

  def list
    @list ||= if action_name == "create"
      board.lists.build(list_params)
    else
      board.lists.find(params[:id])
    end
  end

  def lists
    @lists ||= board.lists
  end

  def board
    @board ||= Board.find(params[:list][:board_id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
