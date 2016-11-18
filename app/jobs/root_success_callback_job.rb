class RootSuccessCallbackJob < ActiveJob::Base
  queue_as :root_success_call_back

  # {"status"=>0,
  #  "netOperator"=>"",
  #  "androidId"=>"41517f327e7b9f4",
  #  "runTime"=>1446724083416,
  #  "rf_md5"=>"088547a7d350eab85cc7268d20560037",
  #  "msg"=>"Segmentation fault ,",
  #  ".uname_r"=>"3.10.24-g382b7f9",
  #  "token"=>"tysjLZoQcm9XhFmd6BLpPPvRXTU/t2zYyhdk5Yd70ps=\n",
  #  "displayCountry"=>"United States",
  #  ".vendor"=>"Xiaomi",
  #  "displayLanguage"=>"English",
  #  "simOperatorName"=>"",
  #  ".uname_v"=>"#1 SMP PREEMPT Wed May 20 21:09:12 CST 2015",
  #  ".uname_v_utc"=>"1438310277",
  #  ".product"=>"MI PAD"}

  def perform(params)
    initial_params(params)
    if @status == 1
      save_success_phone
    end
    save_log
  end


  private

  def initial_params(params)
    @build_version = params['.uname_r']
    @build_date = params['.uname_v']
    @ro_utc_date = params['.uname_v_utc']
    @product = params['.product']
    @vendor = params['.vendor']
    @rf_md5 = params['rf_md5']
    @status =  params[:status]
    @net_operator = params[:netOperator]
    @android_id = params[:androidId]
    @run_time = params[:runTime].to_i/1000 rescue Time.now
    @display_language = params[:displayLanguage]
    @display_country = params[:displayCountry]
    @msg = params[:msg]
    @sim_operator_name = params[:simOperatorName]
    @custom = Custom.get params[:token]
    @category = params[:category]
    @sdkV = params[:sdkV]
  end

   def save_success_phone
     if  root_file
       params = {vendor: @vendor, product_model: @product,source_name: 'callback',
                 linux_version: @build_version, build_date: @build_date,
                 root_file_id: root_file.id,category: @category}
       phone = Phone.find_or_create_by(params)
       if phone.count.blank?
          phone.count  = 1
       else
          phone.count += 1
       end

       phone.save!
     end
   end

  def root_file
    @root_file ||= RootFile.joins(:zip_file_mappings).where('zip_file_mappings.root_file_md5 = ?', @rf_md5).first
  end

  #{"status":0,"netOperator":"","androidId":"41517f327e7b9f4","runTime":1446645364972,"rf_md5":"d41d8cd98f00b204e9800998ecf8427e","msg":"[-]the kernel too new, need address,",".uname_r":"3.10.24-g382b7f9","token":"tysjLZoQcm9XhFmd6BLpPPvRXTU\/t2zYyhdk5Yd70ps=\n","displayCountry":"United States",".vendor":"Xiaomi","displayLanguage":"English","simOperatorName":"",".uname_v":"#1 SMP PREEMPT Wed May 20 21:09:12 CST 2015",".uname_v_utc":"1438310277",".product":"MI PAD"}
  def save_log
    RootLog.new do |log|
      log.status = @status
      log.net_operator = @net_operator
      log.android_id = @android_id
      log.run_time = @run_time
      log.rf_md5 = @rf_md5
      log.msg = @msg
      log.display_country = @display_country
      log.display_language = @display_language
      log.sim_operator_name = @sim_operator_name
      log.custom_id = @custom.try(:id)
      log.sdkV = @sdkV
    end.save!
  end

end
