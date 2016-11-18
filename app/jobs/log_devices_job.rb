class LogDevicesJob < ActiveJob::Base
  queue_as :log_devices

  def perform(body)
    params = body['device']
    @custom_id = Custom.get(body[:token]).try(:id)
    device = Device.find_by_android_id params['androidId']
    @ip = body[:ip]
    @source = body[:source] || 1
    if device.present?
      save_device_with_propinfos device,params
    else
      save_new(params)
    end
    save_request_log params
  end



  private
  def save_device_with_propinfos device,params
    device.build_version = params[:propInfo]['.uname_r']
    device.build_date = params[:propInfo]['.uname_v']
    device.ro_utc_date = params[:propInfo]['.uname_v_utc']
    device.product = params[:propInfo]['.product']
    device.vendor = params[:propInfo]['.vendor']
    device.ip = @ip
    device.source = @source.to_i

    device.save!
  end

  def save_request_log params
   RequestLog.new do |log|
     log.ip = @ip
    log.run_time = Time.at(params['currentTime'].to_i/1000)
    log.android_id = params['androidId']
    log.custom_id = @custom_id
   end.save!
  end


  def save_new params
    device = Device.new do |d|
      d.linuxversion = params['linuxversion']
      d.imei = params['imei']
      d.android_id = params['androidId']
      d.mac_addr = params['macAddr']
      d.mem_total = params['MemTotal']
      d.cpu_type = params['cpuType'] || '32bit'
      d.custom_id = @custom_id
    end
    save_device_with_propinfos device,params
    create_prop params[:prop], device.id
    create_cpuinfo params[:cpuinfo], device.id
    create_gles params[:gles], device.id unless params[:gles].blank?
  end
  def create_prop params,device_id
    prop = Prop.new(device_id: device_id)
    params.keys.each do |key|
      prop.public_send("#{key.gsub('.','_')}=", params[key]) rescue nil
    end
    prop.save!
  end

  def create_cpuinfo params,device_id
    cpuinfo = Cpuinfo.new(device_id: device_id)
    params.keys.each do |key|
      cpuinfo.public_send("#{key.gsub('.','_')}=", params[key]) rescue nil
    end
    cpuinfo.save!
  end

  def create_gles params,device_id
    gle = Gle.new(device_id: device_id)
    params.keys.each do |key|
      gle.public_send("#{key.gsub('.','_').downcase}=", params[key]) rescue nil
    end
    gle.save!
  end

end
