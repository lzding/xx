class RemoveCpuTypeFromRefs < ActiveRecord::Migration
  def change
    remove_column :refs, :cpu_type, :string
  end
end
