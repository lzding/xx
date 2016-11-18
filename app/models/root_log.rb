class RootLog < ActiveRecord::Base
  paginates_per 50
  belongs_to :custom
  scope :group_by_status, ->{ joins(' JOIN zip_file_mappings ON zip_file_mappings.root_file_md5 = rf_md5').group('zip_file_mappings.root_file_id') }

  scope :success, -> {joins(' JOIN zip_file_mappings ON zip_file_mappings.root_file_md5 = rf_md5 and status = 1').group('zip_file_mappings.root_file_id').count}
  scope :failed, -> {joins(' JOIN zip_file_mappings ON zip_file_mappings.root_file_md5 = rf_md5 and status = -1').group('zip_file_mappings.root_file_id').count}

  scope :os, -> {joins(' JOIN zip_file_mappings ON zip_file_mappings.root_file_md5 = rf_md5 and status = 1').group('zip_file_mappings.root_file_id').count}
end


