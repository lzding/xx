class RootLogReport < ActiveRecord::Base

  scope :success, -> { where('status = 1')}
  scope :failed, -> { where('status = -1')}
  def self.valid_columns
    RootLogReport.column_names
  end

end
