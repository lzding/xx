class PhoneModelJob < ActiveJob::Base
  queue_as :add_phones

  def perform(phones)
    phones.each do |phone_param|
      PhoneModel.find_or_create_by(filtered_params(phone_param)) unless phone_param.blank?
    end
  end


  private
  def filtered_params params
    val_columns = Rails.cache.fetch("phone_models") do
      PhoneModel.columns.map(&:name) - ["id","created_at","updated_at","custom_id"]
    end
    new_params = {}
    val_columns.each do |col|
      new_params.merge! "#{col}" => params.fetch(col.to_sym,nil)
    end
    new_params
  end

end
