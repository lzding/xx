module RootLogHelper
  LABELS =  {'run_time' => '调用时间','status' => '状态', 'sdkV' => '客户端版本','custom_name' => '渠道', 'msg' => '回调信息'}
  def th_label(th)
    if label = LABELS.fetch(th,nil)
      label
    else
      th.gsub('_','.')
    end
  end
end
