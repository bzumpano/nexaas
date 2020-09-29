module BaseController
  extend ActiveSupport::Concern

  def object_response(object, status = :ok)
    render json: object, status: status
  end
end
