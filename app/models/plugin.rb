class Plugin < ActiveRecord::Base
  validates_presence_of :version, :pkg_name, :file_name
  mount_uploader :file_path, ExecFileUploader
  def to_json
    {url: file_path.to_s, version: version, pkgName: pkg_name, fileName: file_name}
  end
end