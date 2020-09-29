class StoresController < ApplicationController

  PERMITTED_PARAMS = %i[
    name
  ]

  # actions

  def create
    store.save!
    object_response(store, :created)
  end

  def update
    store.update_attributes!(resource_params)
    object_response(store)
  end

  def destroy
    if store.destroy!
    object_response(store)
    end
  end

  def show
    object_response(store)
  end

  private

  def store
    @store ||= find_action? ? Store.find(params[:id]) : Store.new(resource_params)
  end

  def resource_params
    params.require(:store).permit(*PERMITTED_PARAMS) if params[:store]
  end

  def find_action?
    %w[update destroy show].include?(action_name)
  end
end
