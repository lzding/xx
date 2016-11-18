class AddOthersPropsToProps < ActiveRecord::Migration
  def change
    add_column :props, :ro_board_platform, :string
    add_column :props, :ro_product_cpu_abi, :string
    add_column :props, :ro_build_selinux, :string
    add_column :props, :ro_build_selinux_enforce, :string
  end
end
