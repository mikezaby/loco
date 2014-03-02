class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def api_response(resource, options = {}, &block)
    status = options.fetch(:status, 200)
    error_status = options.fetch(:error_status, 422)

    block.call if block_given?

    if status == 204
      render nothing: true, status: status
    else
      render json: resource, status: status
    end
  rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed
    render json: resource, status: error_status
  end
end
