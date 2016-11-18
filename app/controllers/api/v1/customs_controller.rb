class Api::V1::CustomsController < Api::BaseController

  after_action :log_request, only: [:create ]

  def add
    @custom = custom
    if @custom.present?
      @body = request_body
      if @body[:device].present?
         @body.merge! ip: request.ip
         @body.merge! source: 0
        if Rails.env == 'development'
          LogDevicesJob.perform_now @body.with_indifferent_access
        else
          LogDevicesJob.perform_later @body.with_indifferent_access
        end
        render json: {success: true}
      else
        render json: {success: false,msg:"params 'devices' not found"}
      end
    else
      render json: {success: false,msg:"无效渠道商!"}
    end
  end


  private

  def request_body
    @request_params ||= params.with_indifferent_access
  end

  def custom
    if params[:token].present?
      Custom.get(params[:token])
    end
  end

end
