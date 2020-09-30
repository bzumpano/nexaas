module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      object_response({}, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      object_response({ message: e.record.errors.full_messages.join(', ') }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotDestroyed do |e|
      object_response({ message: e.message}, :unprocessable_entity)
    end
  end
end
