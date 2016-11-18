class PhoneModelsController < ApplicationController
  before_action :set_phone_model, only: [:show, :edit, :update, :destroy]

  def index
    @phone_models = PhoneModel.all
    respond_with(@phone_models)
  end

  def show
    respond_with(@phone_model)
  end

  def new
    @phone_model = PhoneModel.new
    respond_with(@phone_model)
  end

  def edit
  end

  def create
    @phone_model = PhoneModel.new(phone_model_params)
    @phone_model.save
    respond_with(@phone_model)
  end

  def update
    @phone_model.update(phone_model_params)
    respond_with(@phone_model)
  end

  def destroy
    @phone_model.destroy
    respond_with(@phone_model)
  end

  private
    def set_phone_model
      @phone_model = PhoneModel.find(params[:id])
    end

    def phone_model_params
      params.require(:phone_model).permit(:ro_product_brand, :ro_product_model, :ro_product_name, :ro_build_version_release, :ro_build_version_sdk, :ro_build_date_utc, :ro_build_date, :ro_board_platform, :ro_hardware, :ro_product_cpu_abi, :proc_version, :proc_meminfo, :proc_cpuinfo)
    end
end
