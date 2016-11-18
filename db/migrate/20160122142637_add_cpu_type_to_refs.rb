class AddCpuTypeToRefs < ActiveRecord::Migration
  def change
    add_column :refs, :cpu_type, :string
  end
end
