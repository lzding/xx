class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :edit, :update, :destroy]
  respond_to :html,:json

  def index
    @components = Component.all
    respond_with(@components)
  end

  def show
    redirect_to components_path
  end

  def new
    @component = Component.new(:status => true)
    respond_with(@component)
  end

  def edit
  end

  def create
    @component = Component.new(component_params)
    @component.save
    respond_with(@component)
  end

  def update
    @component.update(component_params)
    respond_with(@component)
  end

  def destroy
    @component.destroy
    respond_with(@component)
  end

  private
    def set_component
      @component = Component.find(params[:id])
    end

    def component_params
      params.require(:component).permit(:name, :file, :category, :sdk_api_version, :file_hex, :file_directory, :status)
    end
end
