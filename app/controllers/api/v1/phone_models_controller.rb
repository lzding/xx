class Api::V1::PhoneModelsController < Api::BaseController


  def add_phone
    @custom = custom
    if @custom.present?
      if params.with_indifferent_access[:phones].present?
        params.merge! custom_id: @custom.id
        params.merge! ip: request.ip
        PhoneModelJob.perform_later params.with_indifferent_access[:phones]
        render json: {success: true}
      else
        render json: {success: false,msg:"params 'phones' not found"}
      end
    else
      render json: {success: false,msg:"无效渠道商!"}
    end
  end

  private
  def custom
    if params[:token].present?
      Custom.get(params[:token]).present?
    end
  end
end


=begin
    product,vendor,build_version,build_date
    ro_product_brand: nil,
    ro_product_model: nil,
    ro_product_name: nil,
    ro_build_version_release: nil,
    ro_build_version_sdk: nil,
    ro_build_date_utc: nil,
    ro_build_date: nil,
    ro_board_platform: nil,
    ro_hardware: nil,
    ro_product_cpu_abi: nil,
    proc_version: nil,
    proc_meminfo: nil,
    proc_cpuinfo: nil
=end




