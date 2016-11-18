class Ref < ActiveRecord::Base
  validates_presence_of :version, :channel#, :exec_file
  mount_uploader :exec_file, ExecFileUploader

  def to_json
    { version: version || '', url: exec_file.to_s}
  end
end
