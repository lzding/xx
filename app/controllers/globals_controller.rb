class GlobalsController < ApplicationController
  before_action :set_global, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html
  def index
    @globals = Global.all
    respond_with(@globals)
  end

  def show
    redirect_to globals_path
  end

  def new
    @global = Global.new
    respond_with(@global)
  end

  def edit
  end

  def create
    @global = Global.new(global_params)
    @global.save
    respond_with(@global)
  end

  def update
    @global.update(global_params)
    respond_with(@global)
  end

  def destroy
    @global.destroy
    respond_with(@global)
  end

  private
    def set_global
      @global = Global.find(params[:id])
    end

    def global_params
      params.require(:global).permit(:name, :file, :status, :sdk_api_version, :channel_type)
    end
end
