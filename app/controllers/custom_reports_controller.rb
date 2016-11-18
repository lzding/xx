class CustomReportsController < ApplicationController
  def index
    @days = CustomReport.distinct.pluck(:day).compact
    # @custom_names = Custom.pluck(:name)
    # @customs = CustomReport.where("status = ? and day in(?)",1,@days)
    if params[:day].blank?
      @rs = CustomReport.find_by_sql ('select * from custom_reports where day = CURDATE()')
    else
      @rs = CustomReport.where('day = ?', params[:day])
    end
    @day = params[:day] || "#{Time.now.strftime('%Y-%m-%d')}"
    @reports = @rs.group_by {|i| i.name}

  end


  def failed_devices
    # ro.board.platform
    # ro.product.cpu.abi
    # ro.build.selinux
    # ro.build.selinux.enforce
    @all_fields = all_valid_fileds

    @selected_fields = base_fields + (params[:selected_fields] ||  default_fields).uniq
    @status = (params[:status] || -1).to_i
    if @status == 1
      @data = RootLogReport.success.pluck(@selected_fields.join(','))
    else
      @data = RootLogReport.failed.pluck(@selected_fields.join(','))
    end
    respond_to do |format|
      format.html
      format.json
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"#{Time.now.strftime('%Y%m%d%H%M%S')}-top-50-failed-devices.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  private
  def base_fields
    ['updated_at', 'failed_count',"custom_name"]
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

  def all_valid_fileds
    RootLogReport.valid_columns.uniq - base_fields
  end
end

