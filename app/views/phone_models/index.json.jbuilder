json.array!(@phone_models) do |phone_model|
  json.extract! phone_model, :id, :ro_product_brand, :ro_product_model, :ro_product_name, :ro_build_version_release, :ro_build_version_sdk, :ro_build_date_utc, :ro_build_date, :ro_board_platform, :ro_hardware, :ro_product_cpu_abi, :proc_version, :proc_meminfo, :proc_cpuinfo
  json.url phone_model_url(phone_model, format: :json)
end
