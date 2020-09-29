module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      object_response({}, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotDestroyed do |e|
      object_response({}, :unprocessable_entity)
    end
  end
end
