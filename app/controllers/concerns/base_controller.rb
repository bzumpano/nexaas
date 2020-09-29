module BaseController
  extend ActiveSupport::Concern

  PERMITTED_PARAMS = []

  # actions

  def create
    resource.save!
    object_response(resource, :created)
  end

  def update
    resource.update_attributes!(resource_params)
    object_response(resource)
  end

  def destroy
    if resource.destroy!
    object_response(resource)
    end
  end

  def show
    object_response(resource)
  end


  # helpers

  def object_response(object, status = :ok)
    render json: object, status: status
  end

  private

  def resource
    @resource ||= find_action? ? resource_klass.find(params[:id]) : resource_klass.new(resource_params)
  end

  def resource_klass
    resource_name.camelize.constantize
  end

  def resource_symbol
    resource_name.to_sym
  end

  def resource_name
    controller_name.singularize
  end

  def resource_params
    params.require(resource_symbol).permit(*self.class::PERMITTED_PARAMS) if params[resource_symbol]
  end

  def find_action?
    %w[update destroy show].include?(action_name)
  end
end
