# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160227153407) do

  create_table "access_log_reports", id: false, force: :cascade do |t|
    t.datetime "updated_at",                                           null: false
    t.integer  "status",                     limit: 4
    t.string   "custom_name",                limit: 255
    t.integer  "custom_id",                  limit: 4,     default: 0, null: false
    t.string   "android_id",                 limit: 255
    t.integer  "root_file_id",               limit: 4
    t.string   "rf_md5",                     limit: 255
    t.text     "msg",                        limit: 65535
    t.string   "display_country",            limit: 255
    t.string   "display_language",           limit: 255
    t.string   "sim_operator_name",          limit: 255
    t.string   "ro_product_brand",           limit: 255
    t.string   "ro_product_model",           limit: 255
    t.string   "ro_build_version_release",   limit: 255
    t.string   "linuxversion",               limit: 255
    t.string   "ro_board_platform",          limit: 255
    t.string   "ro_hardware",                limit: 255
    t.string   "build_date",                 limit: 255
    t.string   "ro_serialno",                limit: 255
    t.string   "persist_sys_country",        limit: 255
    t.string   "ro_product_name",            limit: 255
    t.string   "ro_build_date",              limit: 255
    t.string   "ro_build_version_sdk",       limit: 255
    t.string   "persist_sys_timezone",       limit: 255
    t.string   "ro_build_description",       limit: 255
    t.string   "persist_sys_language",       limit: 255
    t.string   "ro_btconfig_vendor",         limit: 255
    t.integer  "ro_build_date_utc",          limit: 8
    t.integer  "ro_runtime_firstboot",       limit: 8
    t.string   "ro_boot_cpuid",              limit: 255
    t.string   "ro_build_fingerprint",       limit: 255
    t.string   "persist_sys_dalvik_vm_lib",  limit: 255
    t.string   "ro_product_locale_region",   limit: 255
    t.string   "ro_product_board",           limit: 255
    t.string   "ro_product_locale_language", limit: 255
    t.string   "sdkV",                       limit: 255
    t.datetime "run_time"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["name"], name: "index_admins_on_name", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "channel_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "components", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "file",            limit: 255
    t.integer  "category",        limit: 4
    t.integer  "sdk_api_version", limit: 4
    t.string   "file_hex",        limit: 255
    t.string   "file_directory",  limit: 255
    t.boolean  "status",          limit: 1
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "cpuinfos", force: :cascade do |t|
    t.string   "revision",        limit: 255
    t.string   "modelname",       limit: 255
    t.string   "cpuimplementer",  limit: 255
    t.string   "hardware",        limit: 255
    t.string   "cpurevision",     limit: 255
    t.string   "cpupart",         limit: 255
    t.string   "cpuarchitecture", limit: 255
    t.string   "features",        limit: 255
    t.string   "cpuvariant",      limit: 255
    t.string   "serial",          limit: 255
    t.string   "processorcnt",    limit: 255
    t.integer  "device_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "custom_reports", id: false, force: :cascade do |t|
    t.integer "id",     limit: 4,   default: 0, null: false
    t.string  "name",   limit: 255
    t.integer "status", limit: 4
    t.integer "count",  limit: 8,   default: 0, null: false
    t.string  "day",    limit: 10
  end

  create_table "customs", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "expire_date"
    t.string   "token",        limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "cmd",          limit: 255
    t.boolean  "status",       limit: 1,   default: false, null: false
    t.integer  "channel_type", limit: 4,                   null: false
  end

  add_index "customs", ["status"], name: "index_customs_on_status", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "linuxversion",  limit: 255
    t.string   "imei",          limit: 255
    t.string   "android_id",    limit: 255
    t.string   "mac_addr",      limit: 255
    t.string   "mem_total",     limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "custom_id",     limit: 4
    t.string   "build_version", limit: 255
    t.string   "build_date",    limit: 255
    t.string   "ro_utc_date",   limit: 255
    t.string   "product",       limit: 255
    t.string   "vendor",        limit: 255
    t.string   "ip",            limit: 255
    t.integer  "source",        limit: 4
    t.string   "cpu_type",      limit: 255, default: "32bit", null: false
  end

  add_index "devices", ["custom_id"], name: "index_devices_on_custom_id", using: :btree

  create_table "gles", force: :cascade do |t|
    t.string   "extensions", limit: 255
    t.string   "version",    limit: 255
    t.string   "renderer",   limit: 255
    t.string   "vendor",     limit: 255
    t.integer  "device_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "globals", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "file",            limit: 255
    t.boolean  "status",          limit: 1,   default: true, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "sdk_api_version", limit: 4,   default: 20,   null: false
    t.integer  "channel_type",    limit: 4,                  null: false
  end

  create_table "phone_models", force: :cascade do |t|
    t.string   "ro_product_brand",         limit: 255
    t.string   "ro_product_model",         limit: 255
    t.string   "ro_product_name",          limit: 255
    t.string   "ro_build_version_release", limit: 255
    t.string   "ro_build_version_sdk",     limit: 255
    t.string   "ro_build_date_utc",        limit: 255
    t.string   "ro_build_date",            limit: 255
    t.string   "ro_board_platform",        limit: 255
    t.string   "ro_hardware",              limit: 255
    t.string   "ro_product_cpu_abi",       limit: 255
    t.string   "proc_version",             limit: 255
    t.string   "proc_meminfo",             limit: 255
    t.string   "proc_cpuinfo",             limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "custom_id",                limit: 4
    t.string   "ip",                       limit: 255
  end

  create_table "phone_params", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.integer  "phone_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "phone_params", ["phone_id"], name: "index_phone_params_on_phone_id", using: :btree

  create_table "phones", force: :cascade do |t|
    t.string   "vendor",        limit: 255
    t.string   "product_model", limit: 255
    t.string   "linux_version", limit: 255
    t.string   "build_date",    limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "utc_date",      limit: 4
    t.string   "source_name",   limit: 255
    t.integer  "root_file_id",  limit: 4
    t.integer  "category",      limit: 4
    t.integer  "count",         limit: 4,   default: 1
  end

  add_index "phones", ["category"], name: "index_phones_on_category", using: :btree
  add_index "phones", ["linux_version"], name: "index_phones_on_linux_version", using: :btree
  add_index "phones", ["root_file_id"], name: "index_phones_on_root_file_id", using: :btree
  add_index "phones", ["source_name"], name: "index_phones_on_source_name", using: :btree
  add_index "phones", ["utc_date"], name: "index_phones_on_utc_date", using: :btree

  create_table "plugins", force: :cascade do |t|
    t.string   "file_path",  limit: 255
    t.integer  "version",    limit: 4
    t.string   "pkg_name",   limit: 255
    t.string   "file_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "props", force: :cascade do |t|
    t.string   "ro_serialno",                limit: 255
    t.string   "persist_sys_country",        limit: 255
    t.string   "ro_product_name",            limit: 255
    t.string   "ro_build_date",              limit: 255
    t.string   "ro_build_version_sdk",       limit: 255
    t.string   "persist_sys_timezone",       limit: 255
    t.string   "ro_product_brand",           limit: 255
    t.string   "ro_build_description",       limit: 255
    t.string   "ro_build_version_release",   limit: 255
    t.string   "ro_product_model",           limit: 255
    t.string   "persist_sys_language",       limit: 255
    t.string   "ro_btconfig_vendor",         limit: 255
    t.integer  "ro_build_date_utc",          limit: 8
    t.integer  "ro_runtime_firstboot",       limit: 8
    t.string   "ro_boot_cpuid",              limit: 255
    t.string   "ro_build_fingerprint",       limit: 255
    t.string   "persist_sys_dalvik_vm_lib",  limit: 255
    t.integer  "device_id",                  limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "ro_product_locale_region",   limit: 255
    t.string   "ro_hardware",                limit: 255
    t.string   "ro_product_board",           limit: 255
    t.string   "ro_product_locale_language", limit: 255
    t.string   "ro_board_platform",          limit: 255
    t.string   "ro_product_cpu_abi",         limit: 255
    t.string   "ro_build_selinux",           limit: 255
    t.string   "ro_build_selinux_enforce",   limit: 255
  end

  create_table "refs", force: :cascade do |t|
    t.integer  "version",    limit: 4
    t.string   "channel",    limit: 255
    t.string   "exec_file",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "request_logs", force: :cascade do |t|
    t.integer  "custom_id",  limit: 4
    t.datetime "run_time"
    t.string   "android_id", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "ip",         limit: 255
  end

  create_table "root_files", force: :cascade do |t|
    t.string   "file",            limit: 255
    t.string   "source_name",     limit: 255
    t.string   "file_hex",        limit: 255
    t.integer  "sort_num",        limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "file_directory",  limit: 255
    t.string   "comment",         limit: 255
    t.string   "execute_params",  limit: 255
    t.integer  "category",        limit: 4
    t.string   "keyword",         limit: 255
    t.boolean  "status",          limit: 1,   default: true, null: false
    t.string   "tool_name",       limit: 255
    t.integer  "sdk_api_version", limit: 4,   default: 20,   null: false
  end

  add_index "root_files", ["category"], name: "index_root_files_on_category", using: :btree
  add_index "root_files", ["file_hex"], name: "index_root_files_on_file_hex", using: :btree
  add_index "root_files", ["keyword"], name: "index_root_files_on_keyword", using: :btree
  add_index "root_files", ["source_name"], name: "index_root_files_on_source_name", using: :btree
  add_index "root_files", ["status"], name: "index_root_files_on_status", using: :btree

  create_table "root_log_reports", id: false, force: :cascade do |t|
    t.datetime "updated_at"
    t.integer  "failed_count",               limit: 8,   default: 0, null: false
    t.integer  "status",                     limit: 4
    t.string   "custom_name",                limit: 255
    t.string   "ro_product_brand",           limit: 255
    t.string   "ro_product_model",           limit: 255
    t.string   "ro_build_version_release",   limit: 255
    t.string   "linuxversion",               limit: 255
    t.string   "ro_board_platform",          limit: 255
    t.string   "ro_hardware",                limit: 255
    t.string   "build_date",                 limit: 255
    t.string   "ro_serialno",                limit: 255
    t.string   "persist_sys_country",        limit: 255
    t.string   "ro_product_name",            limit: 255
    t.string   "ro_build_date",              limit: 255
    t.string   "ro_build_version_sdk",       limit: 255
    t.string   "persist_sys_timezone",       limit: 255
    t.string   "ro_build_description",       limit: 255
    t.string   "persist_sys_language",       limit: 255
    t.string   "ro_btconfig_vendor",         limit: 255
    t.integer  "ro_build_date_utc",          limit: 8
    t.integer  "ro_runtime_firstboot",       limit: 8
    t.string   "ro_boot_cpuid",              limit: 255
    t.string   "ro_build_fingerprint",       limit: 255
    t.string   "persist_sys_dalvik_vm_lib",  limit: 255
    t.string   "ro_product_locale_region",   limit: 255
    t.string   "ro_product_board",           limit: 255
    t.string   "ro_product_locale_language", limit: 255
    t.string   "sdkV",                       limit: 255
    t.integer  "run_time",                   limit: 4
  end

  create_table "root_logs", force: :cascade do |t|
    t.integer  "status",            limit: 4
    t.string   "net_operator",      limit: 255
    t.string   "android_id",        limit: 255
    t.integer  "run_time",          limit: 4
    t.string   "rf_md5",            limit: 255
    t.text     "msg",               limit: 65535
    t.string   "display_country",   limit: 255
    t.string   "display_language",  limit: 255
    t.string   "sim_operator_name", limit: 255
    t.integer  "custom_id",         limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "sdkV",              limit: 255
  end

  create_table "tools", force: :cascade do |t|
    t.string   "file_name",  limit: 255,                null: false
    t.boolean  "enabled",    limit: 1,   default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "tools", ["enabled"], name: "index_tools_on_enabled", using: :btree
  add_index "tools", ["file_name"], name: "index_tools_on_file_name", using: :btree

  create_table "zip_file_mappings", force: :cascade do |t|
    t.string   "root_file_md5", limit: 255
    t.integer  "root_file_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "zip_file_mappings", ["root_file_id"], name: "index_zip_file_mappings_on_root_file_id", using: :btree
  add_index "zip_file_mappings", ["root_file_md5"], name: "index_zip_file_mappings_on_root_file_md5", using: :btree

  add_foreign_key "phone_params", "phones"
end
