class UpdateRootLogReports < ActiveRecord::Migration
  def up
    execute <<-SQL
        CREATE OR REPLACE VIEW   access_log_reports as
      SELECT
        rl.updated_at updated_at,
        rl.status,
        c.name        custom_name,
        c.id custom_id,
        rl.android_id,
        zf.root_file_id,
        rl.rf_md5,
        rl.msg,
        rl.display_country,
        rl.display_language,
        rl.sim_operator_name,
        ro_product_brand,
        ro_product_model,
        ro_build_version_release,
        linuxversion,
        ro_board_platform,
        ro_hardware,
        build_date,
        ro_serialno,
        persist_sys_country,
        ro_product_name,
        ro_build_date,
        ro_build_version_sdk,
        persist_sys_timezone,
        ro_build_description,
        persist_sys_language,
        ro_btconfig_vendor,
        ro_build_date_utc,
        ro_runtime_firstboot,
        ro_boot_cpuid,
        ro_build_fingerprint,
        persist_sys_dalvik_vm_lib,
        ro_product_locale_region,
        ro_product_board,
        ro_product_locale_language,
        sdkV,
        rl.run_time
      FROM root_logs rl JOIN devices d ON rl.android_id = d.android_id
        JOIN props p ON d.id = p.device_id
        JOIN customs c ON (c.id = rl.custom_id)
        JOIN zip_file_mappings zf ON (zf.root_file_md5 = rf_md5)
      ORDER BY updated_at DESC;
    SQL
  end

  def down
    execute <<-SQL
        drop view access_log_reports
    SQL
  end
end
