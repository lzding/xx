class Api::V1::UpgradeController < Api::BaseController
  before_action :request_body

  KEY = 'Y2NiOWRmN2IyYjA5M2E2Yw=='

  def show
    result = {}
    if @body[:vercode] && @body[:cpuType] && @body[:channel]
      result.merge! msg: 'success', code: 1
      result.merge! upgrade: get_ref
      result.merge! plugins: plugins
    else
      result.merge! msg: 'failed', code: 0
      result.merge! upgrade: Ref.new.to_json
      result.merge! plugins: []
    end
    render json: {body: Cipher.aes_encrypt(KEY,result.to_json)}
  end

  private

  def request_body
    @body ||= (JSON.parse Cipher.aes_decrypt(KEY,params[:body]).strip).with_indifferent_access
  end

  def get_ref
    ref = Ref.where('version > ?',@body[:vercode]).first
    (ref || {}).to_json
  end

  def plugins
    Plugin.all.map(&:to_json)
  end
end
