class Tool < ActiveRecord::Base
  validates_presence_of :file_name
  validates_uniqueness_of :file_name

  before_save :down_case_file_name

  scope :enabled_file_names, ->{where('enabled = ?', true).pluck(:file_name)}



  private
  def down_case_file_name
    self.file_name = self.file_name.downcase
  end
end
