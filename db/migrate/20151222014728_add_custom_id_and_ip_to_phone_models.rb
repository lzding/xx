class AddCustomIdAndIpToPhoneModels < ActiveRecord::Migration
  def change
    add_column :phone_models, :custom_id, :integer
    add_column :phone_models, :ip, :string
  end
end
