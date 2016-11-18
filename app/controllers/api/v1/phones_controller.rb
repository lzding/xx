class Api::V1::PhonesController < Api::BaseController

  after_action :log_request, only: [:create ]
  KEY = 'Y2NiOWRmN2IyYjA5M2E2Yw=='
  BASE_PATH  ='app/assets/root_rules/'

  def create
    @body = request_body
    
    if validate_custom?
      build_version = @body['device']['propInfo']['.uname_r']
      build_date = @body['device']['propInfo']['.uname_v']
      ro_utc_date = @body['device']['propInfo']['.uname_v_utc']
      product = @body['device']['propInfo']['.product']
      vendor = @body['device']['propInfo']['.vendor']
      android_version = @body['device']['prop']['ro.build.version.release']
      sdk_version = @body['device']['prop']['ro.build.version.sdk']
      category = @body['category'] || 0
      keyword = @body['keyword']
      root_files = Phone.root_tools(product,vendor,build_version,build_date,ro_utc_date,android_version,category,keyword,sdk_version)
      # #TODOS 挪出去。家缓存
      # component = if root_files && root_files.count > 0
      #               Component.component(category,sdk_version)
      #             end
      # component ||= Component.new
      custom = Custom.get(@body['token'])
      #TODOS 挪出去。家缓存
      type = custom.channel_type rescue nil
      global = Global.validate_files(sdk_version,type)
      bin_hash = {}
      bin_hash.merge! category: category
      bin_hash.merge! bra: root_files.map(&:to_json)
      bin_hash.merge! poc: Cipher.rsa_encrypt(@body['device']['currentTime'] +";" + "#{@body['device']['androidId']};" + (custom.cmd rescue ''))
      bin_hash.merge! global:global.file.to_s
      # bin_hash.merge! component:component.file.to_s
      render json: {body:Cipher.aes_encrypt(KEY,bin_hash.to_json)}
    else
      render json: {body: ''}
    end
  end

  def show
    file = RootFile.find_by_file_hex '24fe50d6faf85bdfb2e410654787e89e'
    name = Digest::MD5.hexdigest (file.file_hex + DateTime.now.to_s)
    send_file (Rails.root.join BASE_PATH, file.file), filename: name+'_'+file.source_name
  end


  def root_master_callback
  hash = {}
  if request_body['rf_md5'].present?
      RootSuccessCallbackJob.perform_later request_body
      hash.merge!(info: 'Success',code: '200')
    else
      hash.merge!(info: 'MD5 Must not be null',code: '500')
    end
    render json: {body: Cipher.aes_encrypt(KEY,hash.to_json)}
  end

  private
  def validate_custom?
     return true if Rails.env == 'development'
    Custom.valid_source? @body['token']
  end

  def request_body
    @request_params ||= JSON.parse Cipher.aes_decrypt(KEY,params[:body]).strip
    @request_params.with_indifferent_access# if @request_params.is_a? Hash
  end
  def log_request
    LogDevicesJob.perform_later @body.with_indifferent_access unless @body['device'].blank?
  end

end
