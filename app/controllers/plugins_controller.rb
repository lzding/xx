class PluginsController < ApplicationController
  before_action :set_plugin, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @plugins = Plugin.all
    respond_with(@plugins)
  end

  def show
    redirect_to plugins_path
  end

  def new
    @plugin = Plugin.new
    respond_with(@plugin)
  end

  def edit
  end

  def create
    @plugin = Plugin.new(plugin_params)
    @plugin.save
    respond_with(@plugin)
  end

  def update
    @plugin.update(plugin_params)
    respond_with(@plugin)
  end

  def destroy
    @plugin.destroy
    respond_with(@plugin)
  end

  private
    def set_plugin
      @plugin = Plugin.find(params[:id])
    end

    def plugin_params
      params.require(:plugin).permit(:file_path, :version, :pkg_name, :file_name)
    end
end
