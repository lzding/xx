module CustomReportsHelper

  def th_label(th)
    if th == 'failed_count'
      "失败次数"
    elsif th == 'updated_at'
      '最后调用时间'
    elsif th == 'custom_name'
      '渠道'
    elsif ['android_id','build_date'].include? th
      th
    else
      th.gsub('_','.')
    end
  end

  def render_report
    if @reports.blank?
      {}
    else
      nh = {}
      @reports.keys.each do |key|
        nh["#{key}"] = parse_count @reports["#{key}"]
      end
      nh
    end
  end

  private
  def parse_count logs
    hash = {}
      if logs.size == 1
        if logs.first.status == 1
          hash[:succeed] = logs.first.count
          hash[:failed] = 0
        else
          hash[:failed] = logs.first.count
          hash[:succeed] = 0
        end
      else
        sorted = logs.sort_by { |i|i.status}
        hash[:failed] = sorted.first.count
        hash[:succeed] = sorted.last.count
      end
    hash[:custom_id] = logs.first.try(:id)
    hash[:day] = logs.first.try(:day)
    hash
    end
end
