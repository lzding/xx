class RootLogController < ApplicationController
  def index
    @all_fields = RootLogReport.valid_columns
    @selected_fields = base_fields + (params[:selected_fields] ||  default_fields).uniq
    query = AccessLogReport.page(params[:page])
    query = query.where('root_file_id = ?', params[:root_file_id]) if params[:root_file_id].present?
    if params[:status].to_i == -1
      query= query.failed
    elsif params[:status].to_i == 1
      query = query.success
    end
    @logs = query.pluck(@selected_fields.join ',')
  end


  private

  def base_fields
    ['status','run_time','sdkV','custom_name','msg']
  end

  def default_fields
    [ "ro_product_brand",
      "ro_product_model",
      "ro_build_version_release",
      "linuxversion",
      "ro_board_platform",
      "ro_hardware",
      "build_date"]
  end
end
