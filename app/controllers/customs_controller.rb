class CustomsController < ApplicationController
  before_action :set_custom, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  layout 'root_files'

  def index
    @customs = Custom.all
    respond_with(@customs)
  end

  def show
    respond_with(@custom)
  end

  def new
    @custom = Custom.new
    respond_with(@custom)
  end

  def edit
  end

  def create
    @custom = Custom.new(custom_params)
    @custom.save
    respond_with(@custom)
  end

  def update
    @custom.update(custom_params)
    respond_with(@custom)
  end

  def destroy
    @custom.destroy
    respond_with(@custom)
  end

  private
    def set_custom
      @custom = Custom.find(params[:id])
    end

    def custom_params
      params.require(:custom).permit(:name, :expire_date, :cmd, :status, :channel_type)
    end
end
