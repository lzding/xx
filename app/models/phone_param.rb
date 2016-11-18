class PhoneParam < ActiveRecord::Base
  validates_presence_of :phone_id
  belongs_to :phone
end
